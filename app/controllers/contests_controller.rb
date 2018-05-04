class ContestsController < ApplicationController
	def show
		@contest = Contest.find_by(id: params[:id])
	end

	def index
		@contests = Contest.paginate(page: params[:page])
	end

	def new
		@contest = Contest.new
	end

	def create
		@contest = Contest.new(contest_params)
		@contest.is_running = 0
			if @contest.save
				new_problem = Problem.where(contest_id: nil)
				new_problem.each do |prob|
				prob.contest_id = @contest.id
				prob.save
				ActiveJob::ActivateContestJob.set(wait_until: @contest.start_time).perform_later(@contest.id)
			end

			flash[:success] = "Okay, saved!"
			redirect_to @contest
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		@contest = Contest.find_by(id: params[:id])
		@contest.users << User.find_by(id: params[:user_id])
		redirect_to contests_path
	end

	def scoreboard
		@contest = Contest.find_by(id: params[:id])
		@participant = @contest.users
		@problem = @contest.problems
		@submissions = @contest.submissions

		@boardAC = Array.new(@participant.count) {Array.new(@problem.count)}
		@boardCount = Array.new(@participant.count) {Array.new(@problem.count)}
		
		i = 0
		j = 0
		
		for par in @participant
			for prob in @problem
				k1 = prob.submissions.where(user_id: par.id, contest_id: @contest.id).count 
				@boardCount[i][j] = k1
				k2 = prob.submissions.where(result: "Accepted", user_id: par.id).count
				if k2 > 0
					@boardAC[i][j] = 1
				else 
					@boardAC[i][j] = 0
				end
				j+=1
			end
			i+=1
			j=0
		end
		
	end

	def destroy
		Contest.find(params[:id]).problems.each do |prob|
			prob.update_attribute(:contest_id, nil)
		end
		Contest.find(params[:id]).destroy
		flash[:success] = "Contest deleted"
		redirect_to contests_path
	end

	private

	def contest_params
		params.require(:contest).permit(:name, :start_time, :duration)
	end
end

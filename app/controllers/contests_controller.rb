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
		
	end

	private

	def contest_params
		params.require(:contest).permit(:name, :start_time, :duration)
	end
end

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
		@contest.is_running = 1
			if @contest.save
			new_problem = Problem.where(contest_id: nil)
			new_problem.each do |prob|
				prob.contest_id = @contest.id
				prob.save
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

	end



	def scoreboard

	end

	private

	def contest_params
		params.require(:contest).permit(:name, :start_time, :duration)
	end
end

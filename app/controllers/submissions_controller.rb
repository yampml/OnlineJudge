class SubmissionsController < ApplicationController
	#need login auth

	def new
		@submission = Submission.new
	end

	def create

		@problem = Problem.first #example
		#byebug
		@submission = Submission.new(submission_params)
		@submission.problem_id = @problem.id
		@submission.user_id = current_user.id 

		if @submission.save
			flash[:success] = "Okay, saved!"
			redirect_to :back
		else
			render 'new'
		end
	end

	private

	def submission_params
		params.require(:submission).permit(:solution_name)
	end


end

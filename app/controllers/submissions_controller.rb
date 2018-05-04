class SubmissionsController < ApplicationController
	#need login auth

	def index
		@submissions = Submission.paginate(page: params[:page])
		@prob = Problem.all
	end

	def new
		@submission = Submission.new
		@problem = Problem.find(params[:problem_id])
	end

	def create	
		#byebug
		@submission = Submission.new(submission_params)
		@submission.user_id = current_user.id 
		@submission.problem_id = params[:problem_id]
		@submission.time_at_submit = Time.now

		if @submission.save
			flash[:success] = "Okay, saved!"
			ActiveJob::SubmissionProcessJob.perform_now(@submission[:id])
		
			redirect_to @submission
		else
			render 'new'
		end
	end

	def show
		@submission = Submission.find(params[:id])
	end

	private

	def submission_params
		params.require(:submission).permit(:solution_name)
	end


end

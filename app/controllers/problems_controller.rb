class ProblemsController < ApplicationController

  before_action :admin_auth, only: [:new, :edit, :create, :update, :destroy]

  def index

  end

  def show
  
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      flash[:success] = "Okay, saved!"
      redirect_to @problem
    else
      render 'new'
    end
  end

  def edit
  
  end

  def update
  
  end

  def destroy
  
  end

  private

  # Confirms an admin user.
  def admin_auth
    redirect_to(root_url) unless current_user.admin?
  end

    private
 
  def problem_params
    params.require(:problem).permit(:name, :timelimit, :memlimit, {file_name: []})
  end

end

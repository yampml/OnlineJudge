class BlogsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, only: [:destroy]

	def create
		@blog = current_user.blogs.build(blog_params)
		if @blog.save
			flash[:success] = "Blog created!"
			redirect_to current_user
		else
			flash[:danger] = "Blog not created!"
			@feed_items = []
			redirect_to current_user
		end
	end

	def destroy
		@blog.destroy
		flash[:success] = "Blog deleted"
		redirect_to request.referrer || root_url
	end

	private

		def blog_params
			params.require(:blog).permit(:content, :title)
		end

		def correct_user
			@blog = current_user.blogs.find_by(id: params[:id])
			redirect_to root_url if @blog.nil?
		end
		

end

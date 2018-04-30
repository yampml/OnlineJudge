class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		@blog = current_user.blogs.build
  		@feed_items = current_user.feed.paginate(page: params[:page], :per_page => 20)
  	end
  end

  def help
  end

  def about
  end
  
end

class StaticPagesController < ApplicationController
  def home
  	if logged_in?
      @problems = Problem.order("created_at desc").limit(10)
  		@feed_items = Blog.order("created_at desc").limit(10)
  	end
  end

  def help
  end

  def about
  end
  
end

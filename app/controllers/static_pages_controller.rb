class StaticPagesController < ApplicationController
  def home
    @problems = Problem.order("created_at desc").limit(10)
  	@feed_items = Blog.order("created_at desc").limit(10)
  end

  def help
  end

  def about
  end
  
end

class PagesController < ApplicationController
  def index
  	 @posts = Post.all.order("impressions_count DESC")
  	 @lastposts = Post.all.order("created_at DESC").limit(10)
  	 @events = Event.all.order("created_at DESC").limit(10)
  	 
  end
end

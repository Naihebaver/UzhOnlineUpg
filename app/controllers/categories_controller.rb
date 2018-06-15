class CategoriesController < ApplicationController
before_action :authenticate_user!, :except => [:show]
before_action :set_category, only:[:show]

  def index
  	@categories = Category.all
  end

  def show
  	@posts = Post.where(category_id: @category.id)
    @events = Event.all.order("created_at DESC").limit(10)
    @lastposts = Post.all.order("created_at DESC").limit(10)
  end


private
	

  def set_category
    @category = Category.find(params[:id])
  end

end

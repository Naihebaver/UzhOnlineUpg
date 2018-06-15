class PostsController < ApplicationController
before_action :authenticate_user!, :except => [:show]
before_action :authenticate_moderator!, :except => [:show]

before_action :set_post, only:[:show, :edit, :update, :destroy]
impressionist :unique => [:impressionable_type, :impressionable_id, :session_hash]

  def show
    @events = Event.all.order("created_at DESC").limit(10)
    @lastposts = Post.all.order("created_at DESC").limit(10)
    @comments = @post.postcomments
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end


  def edit
    
  end

  def update
    
    @post.update(post_params)
    redirect_to root_path
  end

  def destroy
    
    @post.destroy
    redirect_to root_path
  end

private
  
  def post_params
    params.require(:post).permit(:user_id, :title, :body, :image, :category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end


end
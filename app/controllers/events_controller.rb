class EventsController < ApplicationController
before_action :set_event, only:[:show, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
      params[:event][:user_id] = current_user.id
      @event = Event.create(event_params)
      if @event.save
        redirect_to root_path
      else
        render 'new'
      end
  end

  def edit

  end

  def update
      @event.update(event_params)
      redirect_to root_path
  end

  def show
    @events = Event.all.order("created_at DESC").limit(10)
      @lastposts = Post.all.order("created_at DESC").limit(10)
  end

  def destroy
      @event.destroy
      redirect_to root_path
  end




private
  
  def event_params
    params.require(:event).permit(:user_id, :title, :body, :image, :begin_event, :end_event)
  end

    def set_event
      @event = Event.find(params[:id])
    end



end

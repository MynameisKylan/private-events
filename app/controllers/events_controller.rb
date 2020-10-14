class EventsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def new
    @event = Event.new
  end

  def create
    @current_user = User.find(session[:current_user_id])
    @event = @current_user.hosted_events.build(event_params)

    if @event.save
      @event.attendees << @current_user
      flash.notice = 'Event Created Succesfully'
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def require_login
    if session[:current_user_id].nil?
      redirect_to new_user_path
    end
  end

  def event_params
    params.require(:event).permit(:name, :location, :description, :date)
  end
end

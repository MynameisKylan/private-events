class AttendancesController < ApplicationController
  def create
    @user = User.find(session[:current_user_id])
    @event = Event.find(params[:id])
    if @event.attendees.include?(@user)
      flash.notice = "You're already RSVP'd for this event"
    else
      @event.attendees << @user
      flash.notice = 'Successfully RSVP\'d'
    end

    redirect_to @event
  end
end

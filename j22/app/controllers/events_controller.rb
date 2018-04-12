class EventsController < ApplicationController
  
  def new
    @event = current_user.authored_events.new
  end

  def create
	@user = current_user
	@event = @user.authored_events.new(event_params)
	if @event.save
	  flash[:success] = "You successfully created the event!"
	  redirect_to current_user
	  @event.attendees << current_user
	  @event.save
	else
	  render 'new'
	  flash.now[:error] = "Event could not be created"
	end
  end    	

  def show
    @event = Event.find(params[:id])
  end

  def index
  	@events = Event.all
  end

  def suscribe
    @event = Event.find(params[:id])
    @event.attendees << current_user
    @event.save
    flash[:success] = "You succesfully registered for the event"
    redirect_to events_index_path
  end

  def unsuscribe
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    @event.save
    sleep 5
    flash[:success] = "You succesfully unattended the event"
    redirect_to current_user
  end

  private 
  def event_params
     params.require(:event).permit(:name, :description, :date, :place)
  end  
end
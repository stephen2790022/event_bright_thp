class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @event = Event.all
  end

  def show 
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.admin = current_user  
    if @event.save
      redirect_to event_path(@event.id), success: "Votre événement à était créé avec succès"
    else
      redirect_to new_event_path, danger: 'Informations incorrecte'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_date, :duration, :description, :price, :location) 
  end


end

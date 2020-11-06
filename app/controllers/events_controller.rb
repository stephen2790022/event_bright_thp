class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update]
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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, info: "Vous avez supprimer votre évènement avec succès"
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_date, :duration, :description, :price, :location, :picture) 
  end



end

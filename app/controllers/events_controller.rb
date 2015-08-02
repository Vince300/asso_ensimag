class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    # Users can only update their own events, so the current_user is the owner
    # of this event
    @event.asso = current_user

    if @event.save
      redirect_to @event, notice: "L'évènement a été créé avec succès."
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: "L'évènement a été mis à jour avec succès."
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_url, notice: "L'évènement a été supprimé avec succès."
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params[:event].permit(:name, :start_time, :end_time, :location, :description, :facebook_url)
    end
end

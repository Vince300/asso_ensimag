class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]

  # GET /events
  def index
    @events = Event.coming
  end

  # GET /events/calendar
  def calendar
    respond_to do |format|
      # Respond with calendar page HTML
      format.html
      # Respond with events in range as JSON
      format.json do
        if params[:to] and params[:from]
          date_to = DateTime.strptime(params[:to], '%Q')
          date_from = DateTime.strptime(params[:from], '%Q')
          @events = Event.where('start_time >= :start OR end_time <= :end OR (start_time < :start AND end_time > :end)',
                                start: date_from, end: date_to)
          @success = 1
        else
          @success = 0
        end
      end
      # Respond with CSS with event classes for users
      format.css
    end
  end

  # GET /asso/:id/events?passed
  def asso_events
    @asso = User.friendly.find(params[:id])

    if params[:passed]
      @events = @asso.events.passed
      @passed_events = true
    else
      @events = @asso.events.coming
      @passed_events = false
    end
  end

  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @asso = current_user
  end

  # GET /events/1/edit
  def edit
    @asso = @event.asso
  end

  # POST /events
  def create
    @event = Event.create(event_params)
    @event.slug = nil

    # Users can only update their own events, so the current_user is the owner
    # of this event
    @event.asso = current_user

    if @event.save
      redirect_to event_path(@event), notice: "L'évènement a été créé avec succès."
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

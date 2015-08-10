class EventsController < ApplicationController
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]

  # GET /events(/page/:page)
  def index
    @events = Event.coming.published(current_user).page(params[:page])
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
          @events = Event.published(current_user).where('start_time >= :start OR end_time <= :end OR (start_time < :start AND end_time > :end)',
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

  # GET /asso/:id/events(/page/:page)?passed
  def asso_events
    @asso = User.friendly.find(params[:id])

    if params[:passed]
      @events = @asso.events.passed.published(current_user)
      @passed_events = true
    else
      @events = @asso.events.coming.published(current_user)
      @passed_events = false
    end

    @events = @events.page(params[:page])
  end

  # GET /events/1
  def show
    unless request.original_fullpath == event_path(@event)
      redirect_to event_path(@event)
    end
  end

  # GET /events/new
  def new
    @event = Event.new(asso: current_user)
    @asso = @event.asso

    # Authorize the event
    authorize_event
  end

  # GET /events/1/edit
  def edit
    @asso = @event.asso

    # Authorize the event
    authorize_event
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    # Users can only update their own events, so the current_user is the owner
    # of this event
    @event.asso = current_user

    # Set published datetime
    @event.published ||= DateTime.now

    # Authorize the event
    authorize_event

    if @event.save
      redirect_to event_path(@event), notice: "L'évènement a été créé avec succès."
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    # Authorize the event
    authorize_event

    # Verify update params
    upd_params = event_params
    upd_params[:published] = DateTime.now if upd_params[:published].empty?

    if @event.update(upd_params)
      redirect_to @event, notice: "L'évènement a été mis à jour avec succès."
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    # Authorize the event
    authorize_event

    @event.destroy
    redirect_to events_url, notice: "L'évènement a été supprimé avec succès."
  end

  private
    def set_event
      @event = Event.published(current_user).find(params[:id])
    end

    def event_params
      params[:event].permit(:name, :published, :start_time, :end_time, :location, :description, :facebook_url, :picture)
    end

    def authorize_event
      authorize @event
    end
end

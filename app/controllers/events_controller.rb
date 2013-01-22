class EventsController < ApplicationController

    before_filter :authenticate_user

  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        flash[:success] = "Event was successfully created!"
        format.html { redirect_to  :action => "index", :notice => 'Event was successfully created.' }
        format.json { render :json => @event, :status => :created, :location => @event }
      else
        flash[:error] = "Event was not successfully created!"
        format.html { render :action => "new" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:success] = "Event was successfully updated!"
        format.html { redirect_to  :action => "index", :notice => 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        flash[:error] = "Event was not successfully updated!"
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      flash[:success] = "Event was successfully deleted!"
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end

class EventsController < ApplicationController
    def index
      @events = Event.all
    end

    def new
      @events = Event.new
    end

    def create
      @events = Event.new(event_params)
    end

    private
    def event_params
      params.require(:event).permit(:name, :start_time, :end_time, :location, :description)
    end

end

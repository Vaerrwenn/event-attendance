class EventsController < ApplicationController
    def index
      @events = Event.all
      @search = params["search"]

      if @search.present?
        @name = @search["name"]
        @events = Event.where("name LIKE ?", "%#{@name}%")
        if @events.blank?
          @event_return = "empty"
          # @events = ["No data found"]
        # else
          
        end
      end
    end

    def new
      @screen_mode = "add"
      @event = Event.new
    end

    def show
      @event = Event.find(params[:id])
    end

    def create
      @event = Event.new(event_params)

      if @event.save
        redirect_to @event
      else
        render 'new'
      end 
    end

    def edit
      @screen_mode = "edit"
      @event = Event.find(params[:id])
    end

    def update
      @event = Event.find(params[:id])

      if @event.update(event_params)
        redirect_to @event
      else
        render 'edit'
      end
    end

    def destroy
      @event = Event.find(params[:id])
      @event.destroy

      redirect_to events_path
    end

    private
    def event_params
      params.require(:event).permit(:name, :start_time, :end_time, :location, :description)
    end

    # def search_params
    #   params.require(:event).permit(:name)
    # end
end

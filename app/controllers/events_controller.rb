class EventsController < ApplicationController
  def show
  	@event = Event.find(params["id"])
  end

  def index
    @events = Event.search(params)
  end


end

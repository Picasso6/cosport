class MapsController < ApplicationController

  def index
    @events = Event.all
    gon.events = @events
  end

end

class MapsController < ApplicationController

  def index
    @events = Event.all
    gon.eventsToday = @events.where(start_date: (Time.now.utc+ Time.now.gmt_offset).utc..(Time.now.utc+ Time.now.gmt_offset).utc.end_of_day)
  end

end

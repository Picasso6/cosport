class EventsController < ApplicationController
  #before_action :authenticate_user, only: [:new , :show]

  def show
  	@event = Event.find(params["id"])
  end

  def index
    @events = Event.search(params)
  end


  def create
    @event = Event.create
    @event.title = params['title']
    @event.sport_id = params['sport_id']
    @event.description = params["description"]
    #hour_start = params['hour_start']
    puts "**************"
    puts 'HOURS =>'

    puts params['hour_start'].values[0].to_time
    hour = params['hour_start'].values[0].to_time.strftime('%H').to_i
    minute = params['hour_start'].values[0].to_time.strftime('%M').to_i

    puts "**************"

    @event.start_date = (params["start_date"].to_time + hour.hours + minute.minutes).to_datetime
    #@event.start_date = (params["start_date"].to_time + params['hour_start'].values[0].to_time).to_datetime

    #(start_date.to_time + hour.hours + minute.minutes).to_datetime
    @event.city_id = params["city_id"]

    @event.duration = params["duration"]
    @event.owner_id =  1
    #@event.validated = false
    @event.save

    if @event.save
      #log_in(@user)
      #flash[:success] = "EVENT bien créé !"
      redirect_to event_path(@event.id)
      puts "CRÉATION D'EVENT RÉUSSIE"
    else
      #flash.now[:danger] = 'Problème lors de ta création d'evenement '
      puts "PROBLEME CRÉATION EVENT"
      render :new
    end
  end

  private

  def authenticate_user
   unless current_user
     #flash[:danger] = "Please log in."
     redirect_to new_user_session_path
   end
 end

end

class EventsController < ApplicationController
  #before_action :authenticate_user, only: [:new , :show]

  def show
  	@event = Event.find(params["id"])
    @comment = @event.comments
  end

  def index
    @events = Event.search(params)
  end

  def create
    @event = Event.create
    @event.title = params['title']
    @event.sport_id = params['sport_id']
    @event.description = params["description"]
    @event.duration = params["duration"]
    puts "**************"
    puts 'HOURS =>'
    puts params['hour_start'].values[0].to_time
    hour = params['hour_start'].values[0].to_time.strftime('%H').to_i
    minute = params['hour_start'].values[0].to_time.strftime('%M').to_i
    puts "**************"
    @event.start_date = (params["start_date"].to_time + (hour+1).hours+ minute.minutes).to_datetime
    puts "date time : #{@event.start_date.asctime}"
    @event.city_id = params["city_id"]
    @event.owner_id =  current_user.id
    #@event.validated = false
    @event.save

    if @event.save
      #flash[:success] = "EVENT bien créé !"
      redirect_to event_path(@event.id)
      puts "CRÉATION D'EVENT RÉUSSIE"
    else
      #flash.now[:danger] = 'Problème lors de ta création d'evenement '
      puts "$$$$$$$$PROBLEME CRÉATION EVENT $$$$$$$$"
      puts @event.errors.full_messages
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

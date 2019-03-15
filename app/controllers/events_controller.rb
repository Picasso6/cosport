class EventsController < ApplicationController
  include EventsHelper
  before_action :authenticate_user, only: [:new , :show]
  before_action :not_validated_yet, only: [:show]


  def show
  	@event = Event.find(params["id"])
    @comment = @event.comments
  end

  def index
    @events = Event.search(params)
    @months_array_fr = [ nil, "Janvier", "Fevrier" ," Mars" , "Avril" , "Mai" , "Juin" ,"Juillet", "Août" , "Septembre" , "Octobre" , "Novembre" ,"Décembre"]
    @days_array_fr = ["Dimanche" , "Lundi "," Mardi" , "Mercredi" ,"Jeudi" , "Vendredi", "Samedi" ]
  end

  def create
    puts "paramsr***********"
    puts params['hour_start'].inspect
    hour = params['hour_start'][0,2].to_i
    puts "hour***********"
    puts hour.inspect
    minute = params['hour_start'][0,2].to_i
    puts "minute************"
    puts minute
    @event = Event.new(title: params[:title], description: params[:description], duration: params[:duration], sport_id: params[:sport_id], city_id: params[:city_id], owner_id: current_user.id)
    @event.start_date = (params["start_date"].to_time + hour.hours + minute.minutes).to_datetime
    puts "@event.startdate.class*****************"
    puts @event.start_date.class
    puts "@event(10).startdate.class*****************"
    puts Event.all.find(10).start_date.class
    if @event.save
      redirect_to event_path(@event.id)
    else
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

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new , :show]

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @opinion = Opinion.where(recipient_id: @user)
    @events = []
    Event.where(owner_id: current_user.id).each {|evt| @events << evt }
    Attendance.where(attendee_id: current_user.id).each {|atd| @events << Event.find(atd.event_id)}
    @events_hash = @events.group_by_day { |evt| evt.start_date }
    @months_array_fr = [ nil, "Janvier", "Fevrier" ," Mars" , "Avril" , "Mai" , "Juin" ,"Juillet", "Août" , "Septembre" , "Octobre" , "Novembre" ,"Décembre"]
    @days_array_fr = ["Dimanche" , "Lundi "," Mardi" , "Mercredi" ,"Jeudi" , "Vendredi", "Samedi" ]
  end

end

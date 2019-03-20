class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new , :show]
  config.filter_parameters << :secret_key

  def index
    @user = User.all
  end

  def show
  	@sport = Sport.all
  	@level_sport = UsersSport.level_sport
    @user = User.find(params[:id])
    @opinion = Opinion.where(recipient_id: @user)
    @events = []
    Event.where(owner_id: current_user.id, validation: true).each {|evt| @events << evt }
    Attendance.where(attendee_id: current_user.id, validation: true).each {|atd| @events << Event.find(atd.event_id)}
    @events_hash = @events.group_by_day { |evt| evt.start_date }
    @months_array_fr = [ nil, "Janvier", "Fevrier" ," Mars" , "Avril" , "Mai" , "Juin" ,"Juillet", "Août" , "Septembre" , "Octobre" , "Novembre" ,"Décembre"]
    @days_array_fr = ["Dimanche" , "Lundi "," Mardi" , "Mercredi" ,"Jeudi" , "Vendredi", "Samedi" ]
    if @user.level >= 5 && @user.level <50
      @level = "Curieux"
    elsif @user.level >= 50 && @user.level < 200
      @level = "Appliqué"
    elsif @user.level >= 200 && @user.level < 500
      @level = "Mordu"
    elsif @user.level >= 500
      @level = "Acharné"
    end
  end

  def edit

  end

end

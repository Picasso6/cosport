class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new , :show]

  def index
    @user = User.all
  end

  def show
  	@sport = Sport.all
  	@level_sport = UsersSport.level_sport
    @user = User.find(params[:id])
    @opinion = Opinion.where(recipient_id: @user)

    @future_owned_events = Event.where("owner_id = ? and start_date >= ?", "#{current_user.id}", "#{DateTime.now}")
    @future_owned_events_hash = @future_owned_events.group_by_day { |evt| evt.start_date }
    @past_owned_events = Event.where("owner_id = ? and start_date <= ?", "#{current_user.id}", "#{DateTime.now}")
    @past_owned_events_hash = @past_owned_events.group_by_day { |evt| evt.start_date }
    @user_attendances = Attendance.where("attendee_id = ?", "#{current_user.id}").sort { |a,b| a.event.start_date <=> b.event.start_date }
    @future_attendances = []
    @past_attendances = []
    @user_attendances.each do |attendance|
      if attendance.event.start_date >= DateTime.now
        @future_attendances << attendance
      else
        @past_attendances << attendance
      end
    end
    @future_attendances_hash = @future_attendances.group_by_day { |att| att.event.start_date }
    @past_attendances_hash = @past_attendances.group_by_day { |att| att.event.start_date }
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

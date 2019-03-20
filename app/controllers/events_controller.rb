class EventsController < ApplicationController
  include EventsHelper
  before_action :authenticate_user!, only: [:new , :show]
  before_action :not_validated_yet, only: [:show]
  before_action :same_id, only: [:edit]

  
  def show
  	@event = Event.find(params["id"])
    gon.event = @event
    gon.owner = @event.owner
    gon.sport = @event.sport
    gon.user = current_user
    gon.attendance = current_user.attendances.where(event_id: @event.id).exists? && @event.owner_id != current_user.id
    @comment = @event.comments
  end

  def index
   @events = Event.search(params)
   @events_hash = @events.group_by_day { |evt| evt.start_date }
   @months_array_fr = [ nil, "Janvier", "Fevrier" ," Mars" , "Avril" , "Mai" , "Juin" ,"Juillet", "Août" , "Septembre" , "Octobre" , "Novembre" ,"Décembre"]
   @days_array_fr = ["Dimanche" , "Lundi "," Mardi" , "Mercredi" ,"Jeudi" , "Vendredi", "Samedi" ]
 end

  def create
    date = (params[:start_date] + " " + params[:hour_start]).in_time_zone

    @event = Event.create(title: params[:title], description: params[:description], start_date: date, duration: params[:duration], sport_id: params[:sport_id], city_id: params[:city_id], owner_id: current_user.id,latitude: params[:latitude],  longitude: params[:longitude])
    if @event.errors.any?
      flash[:danger] = "La création d'annonce n'a pas fonctionné."
      redirect_to request.referrer
    else
      flash[:notice] = "Annonce créé avec succès. En attente de validation."
      redirect_to root_path
    end
  end

  def edit
    @event = Event.find(params["id"])
  end

  def update
    @event = Event.find(params["id"])
    date = (params[:event][:start_date] + " " + params[:hour_start]).in_time_zone
    @event.update(title: params[:event][:title], start_date: date, sport_id: params[:event][:sport_id], city_id: params[:event][:city_id], duration: params[:event][:duration], description: params[:event][:description])
    if @event.errors.any?
      flash[:danger] = "L'édition d'annonce n'a pas fonctionné."
      redirect_to request.referrer

    else
      flash[:notice] = "Votre évènement a bien été édité."
      redirect_to event_path(@event.id)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:notice] = "Vous avez correctement supprimer votre annonce."
      redirect_to root_path
    end
  end





end

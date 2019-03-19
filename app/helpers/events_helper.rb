module EventsHelper
  def not_validated_yet
    event = Event.find(params[:id])
   if event.validation != true && current_user.admin != true
      redirect_to root_path
    end
  end

  def same_id
    event = Event.find(params[:id])
   unless current_user[:id] == event.owner.id
      redirect_to root_path
    end
  end
end

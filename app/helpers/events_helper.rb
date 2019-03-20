module EventsHelper

  def same_id
    event = Event.find(params[:id])
   unless current_user[:id] == event.owner.id
      redirect_to root_path
    end
  end
end

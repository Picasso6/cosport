module AttendancesHelper
  def same_id
    user = User.find(params[:user_id])
   unless current_user.id == user.id
      redirect_to root_path
    end
  end
end

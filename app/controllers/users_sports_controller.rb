class UsersSportsController < ApplicationController
  
  def create
  	@user_sport = UsersSport.new(user_id: current_user.id, sport_id: params[:sport], level_user: params[:level])
  	if @user_sport.save
  		redirect_to request.referrer
  	else
  		redirect_to request.referrer
  	end
  end

end

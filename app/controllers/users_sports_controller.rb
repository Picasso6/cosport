class UsersSportsController < ApplicationController
  
  def create
  	puts "******************************************"
  	puts params
  	@user_sport = UsersSport.new(user_id: current_user.id, sport_id: params[:sport])
  	puts "///////////////////////////////////////////"
  	puts @user_sport.sport
  	puts @user_sport.user.id
  	puts "/////////////////////////////////////////"
  	if @user_sport.save
  		redirect_to request.referrer
  	else
  		redirect_to request.referrer
  	end
  end

end

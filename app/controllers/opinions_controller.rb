class OpinionsController < ApplicationController

  def create
  	puts "////////////////////////////////////"
  	puts current_user.id
  	puts params[:user_id].to_i
  	puts params[:content]
  	@opinion = Opinion.new(content: params[:content], recipient_id: params[:user_id], sender_id: current_user.id)
	if @opinion.save
		redirect_to request.referrer
	else
		redirect_to request.referrer
	end
  end

end

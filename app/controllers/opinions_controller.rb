class OpinionsController < ApplicationController

  def create
  	@opinion = Opinion.new(content: params[:content], recipient_id: params[:user_id], sender_id: current_user.id)
  	if @opinion.save
  		redirect_to request.referrer
  	else
  		redirect_to request.referrer, status: :unprocessable_entity
  	end
  end

  def destroy

	  @opinion = Opinion.find(params[:id])
    @opinion.destroy
    redirect_to request.referrer
  end

end


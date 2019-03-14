class CommentsController < ApplicationController

	def create
		@comment = Comment.new(content: params[:content], event_id: params[:event_id], user_id: current_user.id)
		if @comment.save
			redirect_to request.referrer
		else
			redirect_to request.referrer
		end
	end

	def destroy
		puts "//////////////////////////////////////////"
		puts params
		@comment = Comment.find(params[:id])
    	@comment.destroy
    	redirect_to request.referrer
	end

end

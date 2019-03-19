class CommentsController < ApplicationController

	def show
    	if params[:message]
      		@message = params[:message]
    	end
  	end

	def create
		@comment = Comment.new(content: params[:content], event_id: params[:event_id], user_id: current_user.id)
		if @comment.save
			redirect_to request.referrer
		else
			redirect_to request.referrer
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
    	@comment.destroy
    	redirect_to request.referrer
	end

end

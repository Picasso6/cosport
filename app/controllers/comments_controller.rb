class CommentsController < ApplicationController

	def create
		@comment = Comment.new(content: params[:content], event_id: params[:event_id], user_id: current_user.id)
		if @comment.save
			flash[:notice] = "Le commentaire a bien été envoyé."
			redirect_to request.referrer
		else
			flash[:danger] = "Erreur lors de la demande de participation."
			redirect_to request.referrer
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
    	@comment.destroy
    	redirect_to request.referrer
	end

end

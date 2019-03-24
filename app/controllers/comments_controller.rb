class CommentsController < ApplicationController

	def create
		@comment = Comment.new(content: params[:content], event_id: params[:event_id], user_id: current_user.id)
		if @comment.save
			 respond_to do |format|
			# flash[:notice] = "Le commentaire a bien été envoyé."
			# redirect_to request.referrer
			format.html { redirect_to request.referrer }
			 format.js
			 # Comment.last.destroy
		end
		else
			puts @comment.errors.full_messages
			flash[:danger] = "Erreur lors de l'envoi du commentaire'."
			redirect_to request.referrer, status: :unprocessable_entity
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
    	if @comment.destroy
				respond_to do |format|
				format.html { redirect_to request.referrer }
				format.js
			end
		end
	end

end

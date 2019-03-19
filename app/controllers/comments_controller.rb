class CommentsController < ApplicationController

	def show
    	if params[:message]
      		@message = params[:message]
    	end
  	end

	def create
		puts "*************************************************"
		puts params
		puts current_user.id
		@comment = Comment.new(content: params[:content], event_id: params[:event_id], user_id: current_user.id)
		puts "////////////////////////////////////////////////////"
		puts @comment.user_id
		if @comment.save
			puts "ififififiifififififiifififififiififif"
			redirect_to request.referrer
		else
			puts "elellelelelellelelellelelellelelelele"
			redirect_to request.referrer
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
    	@comment.destroy
    	redirect_to request.referrer
	end

end

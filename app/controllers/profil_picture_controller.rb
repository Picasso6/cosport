class ProfilPictureController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		@user.profil_picture.attach(params[:profil_picture])
		redirect_to(edit_user_registration_path)
	end

end

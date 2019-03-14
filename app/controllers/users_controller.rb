class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @opinion = Opinion.where(recipient_id: @user)
  end

end

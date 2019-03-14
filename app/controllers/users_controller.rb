class UsersController < ApplicationController


  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @opinion = Opinion.where(recipient_id: @user)
  end

end

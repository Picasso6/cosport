class UsersController < ApplicationController
  def show
  	puts "***************************************************"
  	puts params
    @user = User.find(params[:id])
  end
end

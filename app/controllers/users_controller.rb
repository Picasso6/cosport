class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @opinion = Opinion.where(recipient_id: @user)
    puts "**********************************"
    @opinion.each do |opi|
    	puts "///////////////////"
    	puts opi.id
    end
    puts "*************************************"
  end

end

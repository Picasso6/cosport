class UsersController < ApplicationController


  def index
    @user = User.all
  end

  def show
  	@sport = Sport.all
  	@level_sport = UsersSport.level_sport
    @user = User.find(params[:id])
    @opinion = Opinion.where(recipient_id: @user)
  end
  
  def edit
  	
  end

end

class Admin::UsersController < ApplicationController
  include CheckAdminHelper
  before_action :authenticate_user!
  before_action :check_if_admin

  def index
    @user = User.all
  end

  def destroy
    @user = User.find(params[:id])
    if Event.exists?(owner: @user)
      Event.where(owner: @user).each do |event|
        event.destroy
      end
    end
    if Attendance.exists?(attendee: @user)
      Attendance.where(attendee: @user).each do |atd|
        atd.destroy
      end
    end
    if Comment.exists?(user: @user)
      Comment.where(user: @user).each do |comment|
        comment.destroy
      end
    end
    @user.destroy
    redirect_to request.referrer
  end
end

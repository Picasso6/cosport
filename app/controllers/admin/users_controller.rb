# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  include CheckAdminHelper
  before_action :authenticate_user!
  before_action :check_if_admin

  def index
    @user = User.all
  end

  def destroy
    @user = User.find(params[:id])
    Event.where(owner: @user).each(&:destroy) if Event.exists?(owner: @user)
    if Attendance.exists?(attendee: @user)
      Attendance.where(attendee: @user).each(&:destroy)
    end
    Comment.where(user: @user).each(&:destroy) if Comment.exists?(user: @user)
    @user.destroy
    redirect_to request.referrer
  end
end

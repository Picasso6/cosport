# frozen_string_literal: true

class Admin::EventsController < ApplicationController
  include CheckAdminHelper
  before_action :authenticate_user!
  before_action :check_if_admin

  def index
    @event = Event.where('start_date >= ?', DateTime.now.to_s)
  end

  def update
    @event = Event.find(params[:id])
    @event.validation = true
    @event.save
    @event.owner.level += 5
    @event.owner.save
    redirect_to request.referrer
  end

  def destroy
    @event = Event.find(params[:id])
    if Attendance.exists?(event: @event)
      Attendance.where(event: @event).each(&:destroy)
    end
    @event.destroy
    redirect_to request.referrer
  end
end

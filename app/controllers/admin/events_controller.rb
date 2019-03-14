class Admin::EventsController < ApplicationController
  include CheckAdminHelper
  before_action :authenticate_user!
  before_action :check_if_admin

  def index
    @unvalidatedevent = []
    Event.all.each do |event|
      unless event.validation?
        @unvalidatedevent << event
      end
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.validation = true
    @event.save
    redirect_to request.referrer
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to request.referrer
  end
end

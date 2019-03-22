class AttendancesController < ApplicationController
  include AttendancesHelper
  before_action :authenticate_user!, only: [:create]
  before_action :same_id, only: [:index]

  def index
    user = User.find(params[:user_id])
    events = Event.where(owner_id: user.id)
    @attendances = []
    events.each do |event|
      event.attendances.each do |attendance|
        if attendance.validation != true
          @attendances << attendance
        end
      end
    end
  end

  def create
    unless already_attended?
        @event = Event.find(params[:event_id])
        @attendance = Attendance.new(attendee_id: current_user.id, event_id: @event.id)
        if @attendance.save
          flash[:notice] = "Votre demande de participation est en attente de validation."
          redirect_to event_path(@attendance.event.id)
        else
          flash[:danger] = "Erreur lors de la demande de participation."
          redirect_to request.referrer
        end
      end
    end



  def edit
    @attendance = Attendance.find(params[:id])
  end

  def update
    @attendance = Attendance.find(params[:id])
    @attendance.update(validation: true)
    @attendance.attendee.level += 1
    if @attendance.attendee.save
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js
      end
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    if @attendance.attendee == current_user &&  @attendance.destroy
      flash[:notice] = "Vous vous être desinscrit de cette annonce."
      redirect_to request.referrer
    elsif @attendance.destroy
      redirect_to request.referrer
    end
  end

  private

  def already_attended?
    Attendance.where(attendee_id: current_user.id, event_id: params[:event_id]).exists?
  end

end

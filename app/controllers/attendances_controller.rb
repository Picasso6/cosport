class AttendancesController < ApplicationController
  def create
    unless already_attended?
      @event = Event.find(params[:event_id])
      @attendance = Attendance.new
      @attendance.attendee_id = current_user.id
      @attendance.event_id = @event.id
      @attendance.save
  end
  redirect_to request.referrer
end

  private

  def already_attended?
    Attendance.where(attendee_id: current_user.id, event_id: params[:event_id]).exists?
  end
  
end

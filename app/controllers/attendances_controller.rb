class AttendancesController < ApplicationController

def create
  unless already_attended?
      @event = Event.find(params[:event_id])
      @attendance = Attendance.new(attendee_id: current_user.id, event_id: @event.id)
      @attendance.save
  end
  redirect_to request.referrer
end

def edit
  @attendance = Attendance.find(params[:id])
end

def update
  @attendance = Attendance.find(params[:id])
  @attendance.update(validation: true)
  redirect_to request.referrer
end

def destroy
  @attendance = Attendance.find(params[:id])
  @attendance.destroy
end

  private

  def already_attended?
    Attendance.where(attendee_id: current_user.id, event_id: params[:event_id]).exists?
  end

end

class AttendancesController < ApplicationController

def create
  unless already_attended?
      @event = Event.find(params[:event_id])
      @attendance = Attendance.new(attendee_id: current_user.id, event_id: @event.id)
      if @attendance.save
        redirect_to request.referrer
      else
        puts @attendance.errors.full_messages
      end

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

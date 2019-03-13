class Attendance < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: "User"
  after_create :new_attendee_send
  after_update :accepted_attendance_send

  def new_attendee_send
    UserMailer.new_attendee(self).deliver_now
  end

  def accepted_attendance_send
    UserMailer.accepted_attendance(self).deliver_now
  end

end

class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def welcome_email(user)
    @user = user

    @url  = 'http://monsite.fr/login'

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def new_attendee(attendance)
    @attendance = attendance
    @user = attendance.event.owner

    @url  = 'http://localhost:3000/events/#{@attendance.event.id}/attendances/#{@attendance.id}/edit'

    mail(to: @user.email, subject: 'Nouveau participant')

  end

  def accepted_attendance(attendance)
    @attendance = attendance
    @user = attendance.attendee

    mail(to: @user.email, subject: 'Ta participation est acceptée')
  end
end

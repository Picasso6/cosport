class User < ApplicationRecord
   #after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :events, foreign_key: 'owner_id', class_name: "Event"
  has_many :attendances, foreign_key: 'attendee_id', class_name: "Attendance"
  has_many :events, through: :attendances



  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def self.qualification_level(sport)
    sport_id = Sport.find_by(sport_name: sport).id
    qualification_array = ["débutant","amateur","confirmé"]
    if self.level == nil
      return "non précisé"
    else
      return qualification_array[self.level[sport_id-1]]
    end
  end

end

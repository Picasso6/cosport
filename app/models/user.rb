class User < ApplicationRecord
   #after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "dont valid email" }
  validates :first_name, presence: true, length: { in: 3..30}
  validates :last_name, presence: true, length: { in: 3..30}

  validates :description, length: { in: 3..150}

  has_many :comments
  has_many :events, foreign_key: 'owner_id', class_name: "Event"
  has_many :attendances, foreign_key: 'attendee_id', class_name: "Attendance"
  has_many :events, through: :attendances



  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end

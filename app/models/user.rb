class User < ApplicationRecord
   after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profil_picture

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "dont valid email" }
  validates :first_name, presence: true, length: { in: 3..30}
  validates :last_name, presence: true, length: { in: 3..30}
  validates :description, length: { maximum: 150}

  has_many :sent_opinions, foreign_key: 'sender_id', class_name: "Opinion"
  has_many :received_opinions, foreign_key: 'recipient_id', class_name: "Opinion"
  has_many :comments, dependent: :destroy
  has_many :events, foreign_key: 'owner_id', class_name: "Event", dependent: :destroy
  has_many :attendances, foreign_key: 'attendee_id', class_name: "Attendance", dependent: :destroy
  has_many :events, through: :attendances, dependent: :destroy

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

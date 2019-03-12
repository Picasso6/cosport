class Event < ApplicationRecord
  belongs_to :city
  belongs_to :sport
  belongs_to :owner, class_name: "User"
  has_many :attendees, through: :attendances
  has_many :comments
end

class Sport < ApplicationRecord
  has_many :events

  has_many :users_sports
  has_many :users, through: :users_sports

  validates :sport_name, presence: true
end

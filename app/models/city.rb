class City < ApplicationRecord
  has_many :events
  validates :city_name, presence: true
end

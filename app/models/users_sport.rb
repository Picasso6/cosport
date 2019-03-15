class UsersSport < ApplicationRecord
  belongs_to :user
  belongs_to :sport

  def self.level_sport
  	return ["debutant", "medium", "hard"]
  end
end

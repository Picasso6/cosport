class Opinion < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
  validates :content, presence: true, length: { in: 10..200}
end

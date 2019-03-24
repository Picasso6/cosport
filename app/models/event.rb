class Event < ApplicationRecord
  belongs_to :city
  belongs_to :sport
  belongs_to :owner, class_name: "User"
  has_many :attendances
  has_many :attendees, through: :attendances
  has_many :comments

  validates :title, presence: true, length: { maximum: 60}

  validates :description, presence: true, length: { maximum: 500}
  validates :start_date, presence: true
  validate :no_events_in_past


  def self.search(params)
    if params["city"] != "Ville" && params["sport"] != "Sport" && params["start_date"] != ""
      where(["city_id = ? and sport_id = ? and start_date >= ? and start_date >= ?", "#{params["city"]}", "#{params["sport"]}", "#{params["start_date"].to_datetime}", "#{DateTime.now}"])
    elsif params["city"] != "Ville" && params["sport"] == "Sport" && params["start_date"] == ""
      where(["city_id = ? and start_date >= ?", "#{params["city"]}", "#{DateTime.now}"])
    elsif params["city"] == "Ville" && params["sport"] != "Sport" && params["start_date"] == ""
      where(["sport_id = ? and start_date >= ?", "#{params["sport"]}", "#{DateTime.now}"])
    elsif params["city"] != "Ville" && params["sport"] != "Sport" && params["start_date"] == ""
      where(["city_id = ? and sport_id = ? and start_date >= ?", "#{params["city"]}", "#{params["sport"]}", "#{DateTime.now}"])
    elsif params["city"] != "Ville" && params["sport"] == "Sport" && params["start_date"] != ""
      where(["city_id = ? and start_date >= ? and start_date >= ?", "#{params["city"]}", "#{params["start_date"].to_datetime}", "#{DateTime.now}"])
    elsif params["city"] == "Ville" && params["sport"] != "Sport" && params["start_date"] != ""
      where(["sport_id = ? and start_date >= ? and start_date >= ?", "#{params["sport"]}", "#{params["start_date"].to_datetime}", "#{DateTime.now}"])
    else
      where(["start_date >= ?", "#{DateTime.now}"])
    end
  end

  def no_events_in_past
    if start_date.present? && start_date < DateTime.now
        errors.add(:start_date, "Le cosport ne peux pas être dans le futur")
    end
  end

end

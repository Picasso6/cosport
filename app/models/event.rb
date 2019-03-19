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


  def self.search(params)
    if params["city"] != "Ville" && params["sport"] != "Sport" && params["start_date"] != ""
      where(["city_id = ? and sport_id = ? and start_date >= ? and validation = ? and start_date >= ?", "#{params["city"]}", "#{params["sport"]}", "#{params["start_date"].to_datetime}", "#{true}", "#{DateTime.now}"])
    elsif params["city"] != "Ville" && params["sport"] == "Sport" && params["start_date"] == ""
      where(["city_id = ? and validation = ? and start_date >= ?", "#{params["city"]}", "#{true}", "#{DateTime.now}"])
    elsif params["city"] == "Ville" && params["sport"] != "Sport" && params["start_date"] == ""
      where(["sport_id = ? and validation = ? and start_date >= ?", "#{params["sport"]}", "#{true}", "#{DateTime.now}"])
    elsif params["city"] != "Ville" && params["sport"] != "Sport" && params["start_date"] == ""
      where(["city_id = ? and sport_id = ? and validation = ? and start_date >= ?", "#{params["city"]}", "#{params["sport"]}", "#{true}", "#{DateTime.now}"])
    elsif params["city"] != "Ville" && params["sport"] += "Sport" && params["start_date"] != ""
      where(["city_id = ? and start_date >= ? and validation = ? and start_date >= ?", "#{params["city"]}", "#{params["start_date"].to_datetime}", "#{true}", "#{DateTime.now}"])
    elsif params["city"] == "Ville" && params["sport"] != "Sport" && params["start_date"] != ""
      where(["sport_id = ? and start_date >= ? and validation = ? and start_date >= ?", "#{params["sport"]}", "#{params["start_date"].to_datetime}", "#{true}", "#{DateTime.now}"])
    else
      where(["validation = ? and start_date >= ?", "#{true}", "#{DateTime.now}"])
    end
  end

end

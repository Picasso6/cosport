class Event < ApplicationRecord
  belongs_to :city
  belongs_to :sport
  belongs_to :owner, class_name: "User"
  has_many :attendees, through: :attendances
  has_many :comments


  def self.search(params)
    puts params
    if params["city"] != ""
    @city_id = City.find_by(city_name: params["city"]).id
    @sport_id = Sport.find_by(sport_name: params["sport"]).id
      where(["city_id = ? and sport_id = ?", "#{@city_id}", "#{@sport_id}"])
    else
      all
    end
  end

end

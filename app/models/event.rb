class Event < ApplicationRecord
  belongs_to :city
  belongs_to :sport
  belongs_to :owner, class_name: "User"
  has_many :attendees, through: :attendances
  has_many :comments
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 8904c802ea9da19360b82654edaceb7e9585231a

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
<<<<<<< HEAD
=======
>>>>>>> master
=======

>>>>>>> 8904c802ea9da19360b82654edaceb7e9585231a
end

class Event < ApplicationRecord
  belongs_to :city
  belongs_to :sport
  belongs_to :owner, class_name: "User"
  has_many :attendees, through: :attendances
  has_many :comments
  validates :title, presence: true, length: { maximum: 20}
  validates :description, presence: true, lenght: { maximum: 500}
  validates :start_date, presence: true


  def self.search(params)
    puts params
    if params['start_date'] != ""
      hour = params['hour_start'].values[0].to_time.strftime('%H').to_i
      minute = params['hour_start'].values[0].to_time.strftime('%M').to_i
      @given_start_date = (params["start_date"].to_time + hour.hours + minute.minutes).to_datetime
    end
    if params["city"] != "" && params["sport"] != "" && params["start_date"] != ""
      where(["city_id = ? and sport_id = ? and start_date >= ?", "#{params["city"]}", "#{params["sport"]}", "#{@given_start_date}"])
    elsif params["city"] != "" && params["sport"] == "" && params["start_date"] == ""
      where(["city_id = ?", "#{params["city"]}"])
    elsif params["city"] == "" && params["sport"] != "" && params["start_date"] == ""
      where(["sport_id = ?", "#{params["sport"]}"])
    elsif params["city"] != "" && params["sport"] != "" && params["start_date"] == ""
      where(["city_id = ? and sport_id = ?", "#{params["city"]}", "#{params["sport"]}"])
    else
      all
    end
  end

end

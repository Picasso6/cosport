desc "Creer des events"
task create_event_dayly: :environment do
  date1 =  Time.now + 6.hours
  date2 =  Time.now + 9.hours
  date3 =  Time.now + 12.hours
  date4 =  Time.now + 15.hours
  date5 =  Time.now + 18.hours
  Event.create!(title: "Foot à la citadelle", description: "Ramenez vos meilleures baskets", start_date: date1, duration: 30, city_id: 6, sport_id: 1 ,owner_id: 1, latitude:  50.640169, longitude:  3.066667)
  Event.create!(title: "Pétanque à la citadelle", description: "Ramenez vos boules", start_date: date2, duration: 30, city_id: 6, sport_id: 3 ,owner_id: 1, latitude:  50.643859, longitude:  3.046866)
  Event.create!(title: "Running fractionné", description: "Ramenez vos meilleures baskets", start_date: date3, duration: 45, city_id: 6, sport_id: 4 ,owner_id: 1, latitude:  50.626555, longitude:  3.06946)
  Event.create!(title: "9 trous sur la MEL", description: "Ramenez votre drive", start_date: date4, duration: 50, city_id: 6, sport_id: 13 ,owner_id: 1, latitude: 50.60768, longitude: 3.111175)
  Event.create!(title: "Travailler son revers", description: "Ramenez votre raquette", start_date: date5, duration: 50, city_id: 6, sport_id: 5 ,owner_id: 1, latitude: 50.640819, longitude: 3.109012)
end

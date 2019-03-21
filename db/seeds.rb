# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


15.times do
 user_random = User.create!(first_name: Faker::Name.first_name ,last_name: Faker::Name.last_name ,email: Faker::Internet.email, password: Faker::Internet.password(8), gender: Faker::Gender.binary_type, phone_number: "0666666666", confirmed_at: Time.now)
end
puts "Users faker generated"


City.create!(city_name: "Paris", latitude: 48.85661, longitude: 2.351499)
City.create!(city_name: "Lyon", latitude: 45.757814, longitude: 4.832011)
City.create!(city_name: "Marseille", latitude: 43.296174, longitude: 5.369953)
City.create!(city_name: "Toulouse", latitude: 43.604462, longitude: 1.444247)
City.create!(city_name: "Bordeaux", latitude: 44.841225, longitude: -0.580036)
City.create!(city_name: "Lille", latitude: 50.630509, longitude: 3.070641)
City.create!(city_name: "Nice", latitude: 43.700936, longitude: 7.268391)
City.create!(city_name: "Nantes", latitude: 47.218637, longitude: -1.554136)
City.create!(city_name: "Strasbourg", latitude: 48.584614, longitude: 7.750713)
City.create!(city_name: "Rennes", latitude: 48.111339, longitude: -1.68002)
puts "Cities faker generated"

Sport.create!(sport_name: "Football" )
Sport.create!(sport_name: "Handball" )
Sport.create!(sport_name: "Pétanque" )
Sport.create!(sport_name: "Running" )
Sport.create!(sport_name: "Tennis" )
Sport.create!(sport_name: "Natation" )
Sport.create!(sport_name: "Escalade" )
Sport.create!(sport_name: "Basketball" )
Sport.create!(sport_name: "Roller" )
Sport.create!(sport_name: "Volley" )
Sport.create!(sport_name: "Tennis de Table" )
Sport.create!(sport_name: "Badminton" )
puts "Sport categories generated"


20.times do
 event_random = Event.create!(title: Faker::Company.bs[0..19], description: Faker::Hipster.sentence, start_date: Faker::Date.forward(23), duration: 30, city_id: City.all.sample.id, sport_id: Sport.all.sample.id ,owner_id: User.all.sample.id)
end

puts "Events faker generated"


10.times do
 comment_random = Comment.create!(content: Faker::Hipster.sentence , user_id: User.all.sample.id,event_id: Event.all.sample.id  )
end

puts "Comments faker generated"

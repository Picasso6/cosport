# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'ffaker'

15.times do
 user_random = User.create!(first_name: FFaker::NameFR.first_name ,last_name: FFaker::NameFR.last_name ,email: Faker::Internet.email, password: "azerty", phone_number: FFaker::PhoneNumberFR.mobile_phone_number, confirmed_at: Time.now)
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

Event.create!(title: "Petit foot sur la plage", description: "Profitons du beau temps pour faire un petit foot sur la plage le long de la promenade des anglais, c'est détente donc j'accepte tout les niveaux !", start_date: Faker::Date.forward(23), duration: 30, sport_id: 1, city_id: 7, owner_id: User.all.sample.id, latitude: 43.6885, longitude: 7.24078)
Event.create!(title: "Pétanque pour avant le championnat", description: "Je cherche des gens motivé ayant un bon niveau pour m'entrainer à la pétanque avant la coupe du monde", start_date: Faker::Date.forward(23), duration: 30, sport_id: 3, city_id: 3, owner_id: User.all.sample.id, latitude: 43.28018, longitude: 5.360339)
Event.create!(title: "Débutant à l'escalade cherche mentor", description: "Je débute l'escalade et je cherche qq'un qui pourrait m'aider à me motiver !", start_date: Faker::Date.forward(23), duration: 30, sport_id: 7, city_id: 6, owner_id: User.all.sample.id, latitude: 50.643077, longitude:  2.992453)
Event.create!(title: "Aider moi à avoir mon bac de sport !", description: "Je suis trop nul en ping pong faut vraiment que je m'améliore du coup si vous voulez m'aider ça serait cool !", start_date: Faker::Date.forward(23), duration: 30, sport_id: 11, city_id: 1, owner_id: User.all.sample.id, latitude: 48.807211, longitude: 2.396231)
Event.create!(title: "Cherche compagnon de footing", description: "Courir c'est bien mais accompagné c'est mieux ! Je cours à une allure raisonnable ", start_date: Faker::Date.forward(23), duration: 30, sport_id: 4, city_id: 1, owner_id: User.all.sample.id, latitude: 48.835015, longitude: 2.435026)
Event.create!(title: "Besoin d'un gardien URGENT !!", description: "Notre gardien s'est casser la jambe mais nous avons besoin de notre VINCEEEENNNNNT GERAAAAAAAARDDDDD sauvez nous !!!", start_date: Faker::Date.forward(23), duration: 30, sport_id: 2, city_id: 6, owner_id: User.all.sample.id, latitude: 50.621144, longitude: 3.071671)
Event.create!(title: "Partenaire de Tennis SVP", description: "Je suis d'un niveau moyen, ni trop faible ni trop élevé mais je suis assez compétitif", start_date: Faker::Date.forward(23), duration: 30, sport_id: 5, city_id: 8, owner_id: User.all.sample.id, latitude: 47.204877, longitude:  -1.542807)
Event.create!(title: "Quelqu'un pour faire des longueurs avec moi?", description: "Je suis plutôt pépère, je cherche juste qq'un pour m'accompagner quotidiennement", start_date: Faker::Date.forward(23), duration: 30, sport_id: 6, city_id: 5, owner_id: User.all.sample.id, latitude: 44.840495, longitude:  -0.566303)
Event.create!(title: "Cherche volleyeur confirmé", description: "Cherche qqun cherchant a améliorer son niveau en faisant de bonnes rencontres.", start_date: Faker::Date.forward(23), duration: 30, sport_id: 10, city_id: 2, owner_id: User.all.sample.id, latitude: 45.768695, longitude:  4.876883)
Event.create!(title: "Qui pour un bad avec moi ?", description: "Je débarque tout juste a Nantes et je cherche à faire connaissance autour d'un ptit bad!", start_date: Faker::Date.forward(23), duration: 30, sport_id: 12, city_id: 9, owner_id: User.all.sample.id, latitude: 47.19438, longitude:   -1.516371)


puts "Events faker generated"

10.times do
 comment_random = Comment.create!(content: FFaker::LoremFR.phrase , user_id: User.all.sample.id, event_id: Event.all.sample.id  )
end

puts "Comments faker generated"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

15.times do
  user_random = User.create!(first_name: Faker::Name.first_name ,last_name: Faker::Name.last_name ,email: Faker::Internet.email, password: Faker::Internet.password(8), gender: Faker::Gender.binary_type , level: "good")
end
puts "Users faker generated"


# description: Faker::Hipster.sentence ,
# phone_number :Faker::PhoneNumber.cell_phone


10.times do
  city_random = City.create!(city_name: Faker::Address.city )
end
puts "Cities faker generated"

Sport.create!(sport_name: "football" )
Sport.create!(sport_name: "handball" )
Sport.create!(sport_name: "pétanque" )
Sport.create!(sport_name: "running" )
Sport.create!(sport_name: "tennis" )
Sport.create!(sport_name: "natation" )

puts "Sport categories generated"

10.times do
  comment_random = Comment.create!(content: Faker::Hipster.sentence , user_id: rand(1..User.count) , event_id: rand(1..Event.count) )
end
puts "Comments faker generated"

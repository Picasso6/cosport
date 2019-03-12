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

20.times do
  event = Event.new(title: Faker::Company.bs, description: Faker::Config.random, start_date: Faker::Date.forward(23), duration: 30, owner_id: User.all.sample)
  event.save
end

puts "SEED User*20"

# description: Faker::Hipster.sentence ,
# phone_number :Faker::PhoneNumber.cell_phone

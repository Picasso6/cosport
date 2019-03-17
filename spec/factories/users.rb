
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    gender { Faker::Gender.binary_type }
    level { "good" }
    phone_number { 0666666666 }
    description { "blabla" }
  end
end

FactoryBot.define do
  factory :event do
	title { "ici les specs"} 
	description { "bla bla le sport c'est nul"} 
	start_date { Time.now }
	duration { 60 }
	sport { FactoryBot.create(:sport) }
	city { FactoryBot.create(:city) }
	owner { FactoryBot.create(:user) }
  end
end
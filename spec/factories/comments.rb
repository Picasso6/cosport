
FactoryBot.define do
  factory :comment do
	content { "bla bla le sport c'est nul"} 
	user_id { FactoryBot.create(:user) }
	sport_id { FactoryBot.create(:sport) }
  end
end
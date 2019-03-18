
FactoryBot.define do
  factory :comment do
	content { "bla bla le sport c'est nul"} 
	user { FactoryBot.create(:user) }
	event { FactoryBot.create(:event) }
  end
end
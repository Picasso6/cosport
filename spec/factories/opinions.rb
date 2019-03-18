
FactoryBot.define do
  factory :opinion do
	content { "bla bla le sport c'est nul"} 
	event { FactoryBot.create(:event).id }
	user_id { FactoryBot.create(:user).id }
  end
end
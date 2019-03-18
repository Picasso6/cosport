
FactoryBot.define do
  factory :opinion do
	content { "bla bla le sport c'est nul"} 
	recipient { FactoryBot.create(:user) }
	sender { FactoryBot.create(:user) }
  end
end
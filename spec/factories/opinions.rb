
FactoryBot.define do
  factory :opinion do
	content { "bla bla le sport c'est nul"} 
	sender { FactoryBot.create(:user) }
	recipient { FactoryBot.create(:user) }
  end
end

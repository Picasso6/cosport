FactoryBot.define do
  factory :attendance do
    attendee { FactoryBot.create(:user) }
    event { FactoryBot.create(:event) }
    validation { true }
  end
end

FactoryBot.define do
  factory :users_sport do
    user { FactoryBot.create(:user) }
    sport { FactoryBot.create(:sport) }
    level_user { "medium" }
  end
end

require 'rails_helper'

RSpec.describe UsersSport, type: :model do

   before(:each) do 
     @users_sport = FactoryBot.create(:users_sport)
   end
  
  it "has a valid factory" do
    expect(build(:users_sport)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@users_sport).to be_a(UsersSport)
    end

    describe "#level_user" do
      it { expect(@users_sport.level_user).to be_a(String) }
      it { expect(@users_sport).to validate_presence_of(:level_user) }
     end
  end

   context "associations" do

    describe "#owner" do
      it { expect(@users_sport).to belong_to(:user) }
    end

    describe "#city" do
      it { expect(@users_sport).to belong_to(:sport) }
    end

  end

end
require 'rails_helper'

RSpec.describe Sport, type: :model do

   before(:each) do 
     @sport = FactoryBot.create(:sport)
   end
  
  it "has a valid factory" do
    expect(build(:sport)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@sport).to be_a(Sport)
    end

    describe "#sport_name" do
      it { expect(@sport.sport_name).to be_a(String) }
      it { expect(@sport).to validate_presence_of(:sport_name) }

    end

  end

   context "associations" do

    describe "#events" do
      it { expect(@sport).to have_many(:events) }
    end

    describe "#events" do
      it { expect(@sport).to have_many(:users_sports) }
    end

    describe "#events" do
      it { expect(@sport).to have_many(:users) }
    end

  end

end
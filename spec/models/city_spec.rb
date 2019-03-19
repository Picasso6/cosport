require 'rails_helper'

RSpec.describe Attendance, type: :model do

   before(:each) do 
     @city = FactoryBot.create(:city)
   end
  
  it "has a valid factory" do
    expect(build(:city)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@city).to be_a(City)
    end

    describe "#city_name" do
      it { expect(@city.city_name).to be_a(String) }
      it { expect(@city).to validate_presence_of(:city_name) }

    end

  end

  context "associations" do

    describe "#events" do
      it { expect(@city).to have_many(:events) }
    end
  end

end
require 'rails_helper'

RSpec.describe Attendance, type: :model do

   before(:each) do 
     @attendance = FactoryBot.create(:attendance)
   end
  
  it "has a valid factory" do
    expect(build(:attendance)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@attendance).to be_a(Attendance)
    end

    describe "#validation" do
      it { expect(@attendance.validation).to be_in([true, false]) }
    end

  end

  context "associations" do

    describe "#attendee" do
      it { expect(@attendance).to belong_to(:attendee) }
    end

    describe "#event" do
      it { expect(@attendance).to belong_to(:event) }
    end
  end
end
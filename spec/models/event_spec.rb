require 'rails_helper'

RSpec.describe Event, type: :model do

   before(:each) do 
     @event = FactoryBot.create(:event)
   end
  
  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
    end

    describe "#title" do
      it { expect(@event.title).to be_a(String) }
      it { expect(@event).to validate_presence_of(:title) }
      it { expect(@event).to validate_length_of(:title).is_at_most(20) }
    end

    describe "#description" do
      it { expect(@event.description).to be_a(String) }
      it { expect(@event).to validate_presence_of(:description) }
      it { expect(@event).to validate_length_of(:description).is_at_most(500) }
    end

    describe "#start_date" do
      it { expect(@event.start_date).to be_a(Time) }
      it { expect(@event).to validate_presence_of(:start_date) }
    end

  end

   context "associations" do

    describe "#owner" do
      it { expect(@event).to belong_to(:owner) }
    end

    describe "#city" do
      it { expect(@event).to belong_to(:city) }
    end

    describe "#sport" do
      it { expect(@event).to belong_to(:sport) }
    end

    describe "#attendances" do
      it { expect(@event).to have_many(:attendances) }
    end

    describe "#attendees" do
      it { expect(@event).to have_many(:attendees) }
    end

    describe "#comments" do
      it { expect(@event).to have_many(:comments) }
    end

  end
end
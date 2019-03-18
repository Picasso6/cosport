require 'rails_helper'

RSpec.describe Opinion, type: :model do

   before(:each) do 
     @opinion = FactoryBot.create(:opinion)
   end
  
  it "has a valid factory" do
    expect(build(:opinion)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@opinion).to be_a(Opinion)
    end

    describe "#content" do
      it { expect(@opinion.content).to be_a(String) }
      it { expect(@opinion).to validate_presence_of(:content) }
      it { expect(@opinion).to validate_length_of(:content).is_at_least(10) }
      it { expect(@opinion).to validate_length_of(:content).is_at_most(200) }
    end

  end

  context "associations" do

    describe "#sender" do
      it { expect(@opinion).to belong_to(:sender) }
    end

    describe "#recipient" do
      it { expect(@opinion).to belong_to(:recipient) }
    end

  end
end
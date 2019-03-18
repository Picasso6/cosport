require 'rails_helper'

RSpec.describe User, type: :model do

   before(:each) do 
     @user = FactoryBot.create(:user)    
   end
  
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    describe "#first_name" do
      it { expect(@user.first_name).to be_a(String) }
      it { expect(@user).to validate_presence_of(:first_name) }
      it { expect(@user).to validate_length_of(:first_name).is_at_least(1) }
      it { expect(@user).to validate_length_of(:first_name).is_at_most(30) }
    end

    describe "#last_name" do
      it { expect(@user.last_name).to be_a(String) }
      it { expect(@user).to validate_presence_of(:last_name) }
      it { expect(@user).to validate_length_of(:last_name).is_at_least(1) }
      it { expect(@user).to validate_length_of(:last_name).is_at_most(30) }
    end

    describe "#description" do
      it { expect(@user.description).to be_a(String) }
      it { expect(@user).to validate_length_of(:description).is_at_most(150) }
    end

    describe "#level" do
      #it { expect(@user.level).to be_a(Integer) }
    end

   	describe "#phone_number" do
   	  it { expect(@user.description).to be_a(String) }
   	  it { expect(@user).to validate_presence_of(:phone_number) }
      it { expect(@user).to validate_length_of(:phone_number).is_equal_to(10) }  
    end

  end

end
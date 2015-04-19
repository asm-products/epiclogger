require 'rails_helper'

 
describe Member do

  let(:member) { build(:member) }

  it "has a valid factory" do
    expect(build(:member)).to be_valid
  end

  describe "ActiveModel validations" do
    it "is invalid without a name" do 
      expect(member).to validate_presence_of :name
    end 

    it "is invalid without an email" do 
      expect(member).to validate_presence_of :email
    end 
  end

   describe "ActiveRecord associations" do
     it "has many websites" do
      expect(member).to have_many(:websites)
     end
   end

end


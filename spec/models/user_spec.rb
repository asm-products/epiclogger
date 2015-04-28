require 'rails_helper'

 
describe User do

  let(:user) { build(:user) }

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  describe "ActiveModel validations" do
    it "is invalid without a name" do 
      expect(user).to validate_presence_of :name
    end 

    it "is invalid without an email" do 
      expect(user).to validate_presence_of :email
    end 

    it "is invalid without a website " do 
      expect(user).to validate_presence_of :website
    end 

    it "is invalid with duplication email" do 
      expect(user).to validate_uniqueness_of :email
    end 
  end

   describe "ActiveRecord associations" do
       
     it "belongs_to a website" do
      expect(user).to belong_to(:website)
     end
       
    it "has many errors" do
      expect(user).to have_and_belong_to_many(:issues)
     end
       
   end

end

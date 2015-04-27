require 'rails_helper'

 
describe Website do

  let(:website) { build(:website) }

  it "has a valid factory" do
    expect(build(:website)).to be_valid
  end

  describe "ActiveModel validations" do
    it "is invalid without a title" do 
      expect(website).to validate_presence_of :title
    end 

    it "is invalid without a domain" do 
      expect(website).to validate_presence_of :domain
    end 

    it "is invalid without a member" do 
      expect(website).to validate_presence_of :member
    end 
  end

   describe "ActiveRecord associations" do
     it "belongs to member" do
      expect(website).to belong_to(:member)
     end
       
     it "has many users" do
      expect(website).to have_many(:users)
     end
       
    it "has many errors" do
      expect(website).to have_many(:issues)
     end
       
   end

end


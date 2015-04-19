require 'rails_helper'

describe Error do

  let(:error) { build(:error) }

  it "has a valid factory" do
    expect(build(:error)).to be_valid
  end

  describe "ActiveModel validations" do
    it "is invalid without a description" do 
      expect(error).to validate_presence_of :description
    end 

    it "is invalid without a user" do 
      expect(error).to validate_presence_of :user
    end 

  end

   describe "ActiveRecord associations" do
     it "belongs to a user" do
      expect(error).to belong_to(:user)
     end
     it "delegates website to user" do
      expect(error).to delegate_method(:website).to(:user)
     end
   end

end


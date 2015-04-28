require 'rails_helper'

describe UserIssue do

  let(:user_issue) { build(:user_issue) }

  it "has a valid factory" do
    expect(build(:user_issue)).to be_valid
  end

  describe "ActiveModel validations" do
    it "is invalid without a user" do 
      expect(user_issue).to validate_presence_of :user
    end 

    it "is invalid without an issue" do 
      expect(user_issue).to validate_presence_of :issue
    end 
  end

   describe "ActiveRecord associations" do
     it "belongs to user" do
      expect(user_issue).to belong_to(:user)
     end

     it "belongs to issue" do
      expect(user_issue).to belong_to(:issue)
     end
   end

end


require 'rails_helper'

 
describe Message do

  let(:message) { build(:message) }

  it "has a valid factory" do
    expect(build(:message)).to be_valid
  end

  describe "ActiveModel validations" do
    it "is invalid without a content" do 
      expect(message).to validate_presence_of :content
    end 

    it "is validates length of content " do 
      expect(message).to validate_length_of(:content)
    end 


    it "is invalid without an error" do 
      expect(message).to validate_presence_of :issue
    end 

  end

   describe "ActiveRecord associations" do
     it "should belong to an error" do
      expect(message).to belong_to(:issue)
     end
   end

end


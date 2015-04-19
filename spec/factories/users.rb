FactoryGirl.define do
  factory :user do
    name "Test User 1"
    email "testuser@google.com"
    association :website
  end

end

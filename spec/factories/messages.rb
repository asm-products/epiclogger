FactoryGirl.define do
  factory :message do
    association :issue
    content "Test Content for message"
  end

end

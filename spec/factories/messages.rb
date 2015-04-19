FactoryGirl.define do
  factory :message do
    association :error
    content "Test Content for message"
  end

end

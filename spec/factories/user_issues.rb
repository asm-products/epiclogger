FactoryGirl.define do
  factory :user_issue do
    association :user
    association :issue
  end

end

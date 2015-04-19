FactoryGirl.define do
  factory :error do
    description "test description for error"
    association :user
  end

end

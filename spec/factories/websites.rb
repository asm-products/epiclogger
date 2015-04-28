FactoryGirl.define do
  factory :website do
    title "TestSite 1"
    domain "example.com"
    association :member
  end

end

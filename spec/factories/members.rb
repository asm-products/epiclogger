FactoryGirl.define do
  factory :member do
    email "hello@google.com"
    name "Test User 1"
    provider "email"
    confirmed_at Time.now
    password "hello123"
    password_confirmation "hello123"
  end
end

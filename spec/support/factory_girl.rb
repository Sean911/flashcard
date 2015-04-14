require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :list do
    # name "List_1"
    sequence(:name) {|n| "List_#{n}" }
  end
end

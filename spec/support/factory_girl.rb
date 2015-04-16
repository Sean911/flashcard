require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :list do
    sequence(:name) {|n| "List_#{n}" }
  end

  factory :word do
    sequence(:name) {|n| "Word_#{n}" }
    sequence(:definition) {|n| "This is the definition for Word_#{n}" }
    list
  end
end

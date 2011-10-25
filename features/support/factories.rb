FactoryGirl.define do
  factory :user do
    email    'user@example.com'
    password 'password'
  end
end

# Steps for factories
require 'factory_girl/step_definitions'

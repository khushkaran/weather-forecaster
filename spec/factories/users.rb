# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "khush@me.com"
    password "12345678"
  end

  factory :user2, class: User do
    email "sam@me.com"
    password "12345678"
  end
end

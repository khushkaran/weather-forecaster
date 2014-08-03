# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :forecast do
    location "MyString"
    latitude 1.5
    longitude 1.5
    api_data "MyText"
  end
end

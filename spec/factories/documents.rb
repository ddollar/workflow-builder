# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    user_id 1
    name "MyString"
    uuid "MyString"
  end
end

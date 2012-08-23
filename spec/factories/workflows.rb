# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workflow do
    name "MyString"
    trigger "MyString"
    trigger_args "MyText"
  end
end

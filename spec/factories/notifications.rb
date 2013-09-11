# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    num 1
    type ""
    args_raw "MyText"
  end
end

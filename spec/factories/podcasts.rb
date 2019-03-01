# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :podcast do
    title "MyString"
    description "MyText"
    author "MyString"
    dateof "2014-03-13 22:11:01"
  end
end

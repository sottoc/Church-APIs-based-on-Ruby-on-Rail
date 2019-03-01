# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :event do
    title "MyString"
    descripton "MyText"
    starttime "2014-03-06 17:45:26"
    endtime "2014-03-06 17:45:26"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ngo do
    user_id 1
    name "MyString"
    contact_city "MyString"
    contact_country "MyString"
    contact_phone "MyString"
  end
end

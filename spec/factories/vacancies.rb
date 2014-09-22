# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vacancy do
    ngo { FactoryGirl.create(:ngo) }
    service "MyString"
    skill "MyString"
    work_region "MyString"
    remote_status "MyString"
    when_needed "MyString"
    desc "MyString"
    title "MyString"
    is_active false
  end
end

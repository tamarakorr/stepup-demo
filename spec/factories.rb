FactoryGirl.define do
  factory :user do
    name     "Rapunzel"
    email    "rapunzel@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :volunteer do
    user
    cause "Children"
    work_region "India"
    skill "Children's Counseling"
    availability "4 hrs/wk"
    service "Counseling"
    remote_status "Remote"
    contact_mobile "0752 552 5255"
    contact_city "London"
    contact_country "United Kingdom"
  end
end
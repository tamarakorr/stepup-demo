FactoryGirl.define do

  sequence :user_email do |n|
    # A sequence will keep a temporary count of the call made to the 
    #  factory. We can use the count to create dynamic unique values.
    #     e.g, email1@yahoo.com, email2@gmail.com etc.,
    domain = ['yahoo', 'gmail', 'rediffmail'].sample
    "email#{n}@#{domain}.com"
  end

  factory :user do
    name     "Rapunzel"
    email    { FactoryGirl.generate(:user_email) }
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
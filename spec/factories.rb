FactoryGirl.define do
  factory :user do
    name     "Tammy"
    email    "tammy@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
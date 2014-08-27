namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    # users = User.all(limit: 7)

    # Create 50 UK users
    Faker::Config.locale = "en-GB"  # Matches Faker repository -> lib/locales

    50.times do
      #name email password passwordconfirmation
      user = createFakeUser()

      #content = Faker::Lorem.sentence(5)
      cause = ["Advocacy & Human Rights", "Children & Youth", "Community",
        "Computers & Technology", "Crisis Support", "Disaster Relief",
        "Education & Literacy", "Emergency & Safety", "Health & Medicine",
        "Hunger", "Immigrants & Refugees", "Justice & Legal", "LGBT",
        "Women"].sample
      work_region = Faker::Address.country
      skill = [""].sample
      availability = ["6-8pm Tuesdays", "4 hrs/wk", "September 3", "Anytime"].sample
      service = ["Self Defense Trainer", "Web Developer", "Counselor", "Teacher"].sample
      remote_status = ["Yes", "No", "Both"].sample
      contact_mobile = Faker::PhoneNumber.cell_phone
      contact_city = Faker::Address.city
      contact_country = Faker::Address.country #["United Kingdom", "India"].sample

      user.create_volunteer!(cause: cause, work_region: work_region,
        skill: skill, availability: availability, service: service,
        remote_status: remote_status, contact_mobile: contact_mobile,
        contact_city: contact_city, contact_country: contact_country)
    end

    # Create 50 UK NGOs
    50.times do
      user = createFakeUser()

      name = Faker::Lorem.word + " " + ["Hospice", "Relief Agency", "Foundation", "Academy",
        "Missions", "Fund", "Services", "Institute", "Centre", "Year", "International",
        "Britain", "of the UK", "Societies", "Society", "Federation", "Express",
        "Corps", "Alliance"].sample
      contact_city = Faker::Address.city
      contact_country = Faker::Address.country
      contact_phone = Faker::PhoneNumber.phone_number
      user.create_ngo!(name: name, contact_city: contact_city,
        contact_country: contact_country, contact_phone: contact_phone)
    end
  end
end

def createFakeUser()

  name = Faker::Name.name
  email = Faker::Internet.free_email(name)
  password = "stepup"
  password_confirmation = "stepup"
  
  return User.create!(name: name, email: email, password: password,
    password_confirmation: password_confirmation)
end
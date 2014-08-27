namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    service_list = ["Customer Service", "Construction", "Public Speaking", 
          "Teaching/Instruction", "Executive Admin", "Strategic Planning", 
          "Product Development", "Market Research", "Business Analysis", 
          "Professional Law Experience", "Fundraising & Grant Development", 
          "Business Development", "Web Design", "Mental Health", "Legal (General)", 
          "Financial Auditing", "Accounting", "Self Defense Trainer",
          "Counseling"]
    availability_list = ["6-8pm Tuesdays", "4 hrs/wk", "September 3", "Anytime"]
    language_list = ["English", "French"]
    remote_status_list = ["Yes", "No", "Both"]

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
      availability = availability_list.sample
      service = service_list.sample
      remote_status = remote_status_list.sample
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

      name = Faker::Lorem.word.capitalize + " " + ["Hospice", "Relief Agency", "Foundation",
        "Academy",
        "Missions", "Fund", "Services", "Institute", "Centre", "Year", "International",
        "Britain", "of the UK", "Societies", "Society", "Federation", "Express",
        "Corps", "Alliance"].sample
      contact_city = Faker::Address.city
      contact_country = Faker::Address.country
      contact_phone = Faker::PhoneNumber.phone_number
      user.create_ngo!(name: name, contact_city: contact_city,
        contact_country: contact_country, contact_phone: contact_phone)

      # Create random vacancies per NGO
      numVacancies = [0, 1, 2].sample
      numVacancies.times do
        service = service_list.sample
        language = language_list.sample
        work_region = Faker::Address.country
        remote_status = remote_status_list.sample
        when_needed = ["Now", "Sept. 7", "Sept. 16", "September", "October 2014",
          "March 2015"].sample
        desc = Faker::Lorem.sentence
        title = service + " " + ["needed", "needed urgently", "- work with a great team!",
          "position"].sample
        is_active = true

        user.ngo.vacancy.create!(service: service, language: language, work_region: work_region,
          remote_status: remote_status, when_needed: when_needed, desc: desc,
          title: title, is_active: is_active)
      end
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
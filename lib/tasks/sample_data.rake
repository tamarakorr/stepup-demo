namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    users = User.all(limit: 7)

    users.each do |user|
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
      contact_country = ["United Kingdom", "India"].sample
      
      user.create_volunteer!(cause: cause, work_region: work_region,
        skill: skill, availability: availability, service: service,
        remote_status: remote_status, contact_mobile: contact_mobile,
        contact_city: contact_city, contact_country: contact_country)
    end
  end
end
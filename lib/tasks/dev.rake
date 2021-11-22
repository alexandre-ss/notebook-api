namespace :dev do
  desc "setup the development environment"
  task setup: :environment do
    puts "Creating new contacts..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago)
      )
    end
    puts "100 new contacts were created successfully"
  end

end

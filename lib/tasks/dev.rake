namespace :dev do
  desc "setup the development environment"
  task setup: :environment do
    puts "creating contact kind..."
    contact_kinds = %w(Amigo, Comercial, Conhecido)

    contact_kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Creating new contacts..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind_id: 1
    )
    end
    puts "up to date..."
  end

end

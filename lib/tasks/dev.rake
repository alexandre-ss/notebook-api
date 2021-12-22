# frozen_string_literal: true

namespace :dev do
  desc 'setup the development environment'
  task setup: :environment do
    puts 'recreating database...'
    `rails db:drop db:create db:migrate`
    puts 'creating contact kind...'
    contact_kinds = %w[Amigo Comercial Conhecido]

    contact_kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts 'Creating new contacts...'
    100.times do |_i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
        kind_id: 1
      )
    end

    puts 'creating phone numbers...'
    Contact.all.each do |contact|
      Random.rand(5).times do |_i|
        phone = Phone.create(number: Faker::PhoneNumber.cell_phone, contact_id: contact.id)
        contact.phones << phone
        contact.save!
      end
    end

    puts 'creating addresses...'
    Contact.all.each do |contact|
      Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end
    puts 'up to date...'
  end
end

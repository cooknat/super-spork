# frozen_string_literal: true

require "faker"

10.times do
  Club.create!(
    name:    Faker::Color.color_name,
    address: Faker::HitchhikersGuideToTheGalaxy.location,
    contact: Faker::DrWho.character,
    email:   Faker::TheITCrowd.email,
    club_type:  %w[music drama sports martial-arts art maths general languages].sample,
    active: true
  )
end

clubs = Club.all

puts "Seed finished"
puts "#{Club.count} clubs created"

require "faker"

10.times do 
	User.create!(email: Faker::Internet.email, password: 'pw1234')
end	

users = User.all

types = %w[music drama sports martial-arts art maths general languages].map do |type|
	ClubType.create!(name: type)
end

10.times do
  Club.create!(
    name:      Faker::Color.color_name,
    address:   Faker::HitchhikersGuideToTheGalaxy.location,
    contact:   Faker::DrWho.character,
    email:     Faker::Internet.email,
    club_type_id: types.sample.id,
    active:    true,
    user_id: users.sample.id
  )
end

clubs = Club.all

puts "Seed finished"
puts "#{Club.count} clubs created"
puts "#{User.count} users created"

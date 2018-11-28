 require 'faker'

 
 10.times do
 
   Club.create!(
 
     name:  Faker::Color.color_name,
     address:   Faker::HitchhikersGuideToTheGalaxy.location,
     contact:   Faker::DrWho.character,
     email:  Faker::TheITCrowd.email,
     type: %w[ sport music art drama science general ].sample
   )
 end

 clubs = Club.all
 

 puts "Seed finished"
 puts "#{Club.count} clubs created"

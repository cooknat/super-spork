require "factory_bot"

FactoryBot.define do
  factory :club do
    name { "my club" }
    address { "High Street, London" }
    contact { "Mary Poppins" }
    email { "mary.poppins@summerclub.co.uk" }
    association :club_type
    active { true }
  end
end

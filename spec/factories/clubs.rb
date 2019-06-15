# frozen_string_literal: true

require "factory_bot"

FactoryBot.define do
  factory :club do
    name { "my club" }
    address { "High Street, London" }
    contact { "Mary Poppins" }
    email { "mary.poppins@summerclub.co.uk" }
    club_type_id { 20 }
    active { true }
  end
end

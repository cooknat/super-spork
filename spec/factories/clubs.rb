
require 'factory_bot'

FactoryBot.define do
  factory :club do
    name { 'my club' }
    address { 'High Street, London' }
    contact { 'Mary Poppins' }
    email { 'mary.poppins@summerclub.co.uk' }
    club_type { 'other' }
    active { true }
  end
end
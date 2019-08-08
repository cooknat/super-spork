require 'rails_helper'

RSpec.describe ClubType, type: :model do
	 describe "attributes" do
    let(:club_type) { FactoryBot.create(:club_type) }
  
    it "has a name attribute" do
      expect(club_type).to have_attributes(
        name: club_type.name
      )
    end
  end
end

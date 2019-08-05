require "rails_helper"

RSpec.describe Club, type: :model do
  describe "attributes" do
    let(:club_type) { FactoryBot.create(:club_type) }
    let(:club) { FactoryBot.create(:club, club_type_id: club_type.id) }
 

    it "has title and body attributes" do
      expect(club).to have_attributes(
        name:      club.name,
        address:   club.address,
        contact:   club.contact,
        email:     club.email,
        club_type_id: club_type.id,
        active:    club.active
      )
    end
  end

  describe ".init" do
  end
end

# it { is_expected.to belong_to(:topic) }

# it { is_expected.to validate_presence_of(:title) }
# it { is_expected.to validate_presence_of(:body) }
# it { is_expected.to validate_presence_of(:topic) }

# it { is_expected.to validate_length_of(:title).is_at_least(5) }
# it { is_expected.to validate_length_of(:body).is_at_least(20)

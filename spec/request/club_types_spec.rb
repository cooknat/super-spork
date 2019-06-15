require "rails_helper"

RSpec.describe ClubTypesController, type: :request do

	describe "#create" do
    it "increases the number of ClubType by 1" do
      expect { post "/club_types/", params: {club_type: {name: "New Type"}} }.to change(ClubType, :count).by(1)
    end

    it "redirects to clubs index" do
      post "/club_types/", params: {club_type: {name: "New Club"}}
      expect(response).to redirect_to new_club_path
    end
  end
end
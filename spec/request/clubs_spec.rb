# frozen_string_literal: true

require "rails_helper"

RSpec.describe ClubsController, type: :request do
  let(:my_club) { FactoryBot.create(:club, name: "my fecking great club", club_type: "Drama") }

  describe "#index" do
    it "returns http success" do
      get "/clubs"
      expect(response.status).to eq 200
    end

    it "renders the index template" do
      get "/clubs"
      expect(response).to render_template(:index)
    end
  end

  describe "#show" do
    it "returns http success" do
      get "/clubs/", params: {id: my_club.id}
      expect(response.status).to eq 200
    end

    it "renders the show template" do
      get "/clubs/#{my_club.id}"
      expect(response).to render_template(:show)
    end
  end

  describe "#new" do
  	it "returns http success" do
      get "/clubs/new"
      expect(response.status).to eq 200
    end

    it "renders the new template" do
      get "/clubs/new"
      expect(response).to render_template(:new)
    end
  end
end

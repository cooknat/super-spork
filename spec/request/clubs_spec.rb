# frozen_string_literal: true

require "rails_helper"

RSpec.describe ClubsController, type: :request do
  let(:member_user) { FactoryBot.create(:user, email: "thing@thing.com", password: "thingy") }
  let(:owner_user) { User.create!(email: "owner_user@bloccit.com", password: "helloworld", role: :member) }
  let(:admin_user) { User.create!(email: "admin_user@bloccit.com", password: "helloworld", role: :admin) }
  let(:club_type) { ClubType.create!(name: "shiny new clubtype") }
  let(:my_club) { FactoryBot.create(:club, name: "my fecking great club", club_type_id: club_type.id, user_id: owner_user.id) }

  before do
    sign_in member_user
  end

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

  describe "#create" do
    it "increases the number of Club by 1" do
      expect { post "/clubs/", params: {club: {name: "New Club", club_type_id: club_type.id}} }.to change(Club, :count).by(1)
    end

    it "redirects to the new club" do
      post "/clubs/", params: {club: {name: "New Club", club_type_id: club_type.id}}
      expect(response).to redirect_to Club.last
    end
  end

  context "admin user" do
    before do
      sign_in admin_user
    end

    describe "#edit" do
      it "returns http success" do
        get "/clubs/#{my_club.id}/edit"
        expect(response.status).to eq 200
      end

      it "renders the new template" do
        get "/clubs/#{my_club.id}/edit"
        expect(response).to render_template(:edit)
      end
    end
  end

  context "user is club owner" do
    let!(:art_club) { FactoryBot.create(:club, name: "my fecking great art club", club_type_id: club_type.id, user_id: owner_user.id) }

    before do
      sign_in owner_user
    end

    describe "#edit" do
      it "returns http success" do
        get "/clubs/#{art_club.id}/edit"
        expect(response.status).to eq 200
      end

      it "renders the new template" do
        get "/clubs/#{art_club.id}/edit"
        expect(response).to render_template(:edit)
      end
    end
  end

  context "member user" do
    before do
      sign_in member_user
    end

    describe "#edit" do
      it "redirects to the club page " do
        get "/clubs/#{my_club.id}/edit"
        expect(response).to redirect_to club_path(my_club.id)
      end
    end
  end

  describe "#update" do
    it "updates club with new attributes" do
      expect { post "/clubs/", params: {club: {name: "New Club", club_type_id: club_type.id}} }.to change(Club, :count).by(1)
    end

    it "redirects to the new club" do
      post "/clubs/", params: {club: {name: "New Club", club_type_id: club_type.id}}
      expect(response).to redirect_to Club.last
    end
  end

  context "admin user" do
    before do
      sign_in admin_user
    end

    describe "DELETE destroy" do
      it "deletes the club" do
        delete "/clubs/#{my_club.id}"
        count = Club.where(id: my_club.id).size
        expect(count).to eq 0
      end

      it "redirects to clubs index" do
        delete "/clubs/#{my_club.id}"
        expect(response).to redirect_to clubs_path
      end
    end
  end

  context "user is club owner" do
    let!(:art_club) { FactoryBot.create(:club, name: "my fecking great art club", club_type_id: club_type.id, user_id: owner_user.id) }

    before do
      sign_in owner_user
    end

    describe "DELETE destroy" do
      it "deletes the club" do
        delete "/clubs/#{art_club.id}"
        count = Club.where(id: art_club.id).size
        expect(count).to eq 0
      end

      it "redirects to clubs index" do
        delete "/clubs/#{art_club.id}"
        expect(response).to redirect_to clubs_path
      end
    end
  end

  context "member user" do
    before do
      sign_in member_user
    end

    describe "DELETE destroy" do
      it "redirects to clubs index" do
        delete "/clubs/#{my_club.id}"
        expect(response).to redirect_to club_path(my_club.id)
      end
    end
  end
end

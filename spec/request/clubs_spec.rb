# frozen_string_literal: true

require "rails_helper"

RSpec.describe ClubsController, type: :request do
  let(:my_club) { FactoryBot.create(:club, name: "my fecking great club", club_type: "Drama") }
  
   before do
     member_user = User.create!(email: "member_user@bloccit.com", password: "helloworld", role: :member)
     create_session(member_user)
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
      expect { post "/clubs/", params: {club: {name: "New Club"}} }.to change(Club, :count).by(1)
    end

    it "redirects to the new club" do
      post "/clubs/", params: {club: {name: "New Club"}}
      expect(response).to redirect_to Club.last
    end
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

  describe "#update" do
    it "updates club with new attributes" do
      expect { post "/clubs/", params: {club: {name: "New Club"}} }.to change(Club, :count).by(1)
    end

    it "redirects to the new club" do
      post "/clubs/", params: {club: {name: "New Club"}}
      expect(response).to redirect_to Club.last
    end
  end

  context 'admin user' do
  	before do
      admin_user = User.create!(email: "admin_user@bloccit.com", password: "helloworld", role: :admin)
      create_session(admin_user)
      sign_in admin_user
    end

	  describe "DELETE destroy" do
	    it "deletes the club" do
	      delete "/clubs/#{my_club.id}"
	      count = Club.where({id: my_club.id}).size   
	      expect(count).to eq 0
	    end
	 
	     it "redirects to clubs index" do
	       delete "/clubs/#{my_club.id}"
	       expect(response).to redirect_to clubs_path
	     end
	   end
	 end

	context 'member user' do
	 	describe "DELETE destroy" do
	    it "redirects to clubs index" do
	      delete "/clubs/#{my_club.id}"
	      expect(response).to redirect_to club_path(my_club.id)
	    end
	  end
	end
end

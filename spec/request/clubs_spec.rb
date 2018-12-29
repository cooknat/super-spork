require "rails_helper"

RSpec.describe ClubsController, type: :request do
	describe '#index' do
		it "returns http success" do
      get '/clubs'
      expect(response.status).to eq 200
    end
    
    it "renders the index template" do
      get '/clubs'
      expect(response).to render_template(:index)
    end
	end

	describe '#show' do
		it "returns http success" do
      get '/clubs'
      expect(response.status).to eq 200
    end
    
    it "renders the show template" do
      get '/clubs'
      expect(response).to render_template(:show)
    end
	end
end

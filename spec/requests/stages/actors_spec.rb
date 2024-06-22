require 'rails_helper'

RSpec.describe "Stages::Actors", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/stages/actors/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/stages/actors/show"
      expect(response).to have_http_status(:success)
    end
  end

end

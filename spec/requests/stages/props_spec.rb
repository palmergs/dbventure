require 'rails_helper'

RSpec.describe "Stages::Props", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/stages/props/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/stages/props/show"
      expect(response).to have_http_status(:success)
    end
  end

end

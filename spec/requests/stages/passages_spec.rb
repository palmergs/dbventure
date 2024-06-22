require 'rails_helper'

RSpec.describe "Stages::Passages", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/stages/passages/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/stages/passages/show"
      expect(response).to have_http_status(:success)
    end
  end

end

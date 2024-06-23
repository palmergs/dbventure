require 'rails_helper'

RSpec.describe "Stages::Props", type: :request do
  let(:stage) { create(:stage) }

  describe "GET /index" do
    it "returns http success" do
      get "/stages/#{ stage.id }/props"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      prop = create(:prop, slotted: stage)
      get "/stages/#{ stage.id }/props/#{ prop.id }"
      expect(response).to have_http_status(:success)
    end
  end

end

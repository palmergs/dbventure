require 'rails_helper'

RSpec.describe "Stages::Games", type: :request do
  let(:stage) { create(:stage) }

  describe "GET /index" do
    it "returns http success" do
      get "/stages/#{ stage.id }/game"
      expect(response).to have_http_status(:success)
    end
  end

end

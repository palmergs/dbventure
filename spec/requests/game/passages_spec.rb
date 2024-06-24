# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Game::Passages', type: :request do
  let(:passage) { create(:passage) }
  describe 'GET /index' do
    it 'returns http success' do
      get "/game/#{passage.from.id}/passages"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/game/#{passage.from.id}/passages/#{passage.id}"
      expect(response).to have_http_status(:success)
    end
  end
end

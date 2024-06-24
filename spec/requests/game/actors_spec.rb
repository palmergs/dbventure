# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Game::Actors', type: :request do
  let(:actor) { create(:actor) }

  describe 'GET /index' do
    it 'returns http success' do
      get "/game/#{actor.stage.id}/actors"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/game/#{actor.stage.id}/actors/#{actor.id}"
      expect(response).to have_http_status(:success)
    end
  end
end

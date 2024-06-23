# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PropsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/props').to route_to('props#index')
    end

    it 'routes to #new' do
      expect(get: '/props/new').to route_to('props#new')
    end

    it 'routes to #show' do
      expect(get: '/props/1').to route_to('props#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/props/1/edit').to route_to('props#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/props').to route_to('props#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/props/1').to route_to('props#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/props/1').to route_to('props#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/props/1').to route_to('props#destroy', id: '1')
    end
  end
end

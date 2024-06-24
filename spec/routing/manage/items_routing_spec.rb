# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Manage::ItemsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/manage/items').to route_to('manage/items#index')
    end

    it 'routes to #new' do
      expect(get: '/manage/items/new').to route_to('manage/items#new')
    end

    it 'routes to #show' do
      expect(get: '/manage/items/1').to route_to('manage/items#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/manage/items/1/edit').to route_to('manage/items#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/manage/items').to route_to('manage/items#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/manage/items/1').to route_to('manage/items#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/manage/items/1').to route_to('manage/items#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/manage/items/1').to route_to('manage/items#destroy', id: '1')
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Manage::CreaturesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/manage/creatures').to route_to('manage/creatures#index')
    end

    it 'routes to #new' do
      expect(get: '/manage/creatures/new').to route_to('manage/creatures#new')
    end

    it 'routes to #show' do
      expect(get: '/manage/creatures/1').to route_to('manage/creatures#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/manage/creatures/1/edit').to route_to('manage/creatures#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/manage/creatures').to route_to('manage/creatures#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/manage/creatures/1').to route_to('manage/creatures#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/manage/creatures/1').to route_to('manage/creatures#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/manage/creatures/1').to route_to('manage/creatures#destroy', id: '1')
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Manage::ActorsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/manage/actors').to route_to('manage/actors#index')
    end

    it 'routes to #new' do
      expect(get: '/manage/actors/new').to route_to('manage/actors#new')
    end

    it 'routes to #show' do
      expect(get: '/manage/actors/1').to route_to('manage/actors#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/manage/actors/1/edit').to route_to('manage/actors#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/manage/actors').to route_to('manage/actors#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/manage/actors/1').to route_to('manage/actors#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/manage/actors/1').to route_to('manage/actors#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/manage/actors/1').to route_to('manage/actors#destroy', id: '1')
    end
  end
end

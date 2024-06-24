# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Manage::PropsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/manage/props').to route_to('manage/props#index')
    end

    it 'routes to #new' do
      expect(get: '/manage/props/new').to route_to('manage/props#new')
    end

    it 'routes to #show' do
      expect(get: '/manage/props/1').to route_to('manage/props#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/manage/props/1/edit').to route_to('manage/props#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/manage/props').to route_to('manage/props#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/manage/props/1').to route_to('manage/props#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/manage/props/1').to route_to('manage/props#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/manage/props/1').to route_to('manage/props#destroy', id: '1')
    end
  end
end

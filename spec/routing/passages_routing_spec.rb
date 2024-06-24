# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Manage::PassagesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/manage/passages').to route_to('manage/passages#index')
    end

    it 'routes to #new' do
      expect(get: '/manage/passages/new').to route_to('manage/passages#new')
    end

    it 'routes to #show' do
      expect(get: '/manage/passages/1').to route_to('manage/passages#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/manage/passages/1/edit').to route_to('manage/passages#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/manage/passages').to route_to('manage/passages#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/manage/passages/1').to route_to('manage/passages#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/manage/passages/1').to route_to('manage/passages#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/manage/passages/1').to route_to('manage/passages#destroy', id: '1')
    end
  end
end

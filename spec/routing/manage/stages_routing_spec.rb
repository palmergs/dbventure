# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Manage::StagesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/manage/stages').to route_to('manage/stages#index')
    end

    it 'routes to #new' do
      expect(get: '/manage/stages/new').to route_to('manage/stages#new')
    end

    it 'routes to #show' do
      expect(get: '/manage/stages/1').to route_to('manage/stages#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/manage/stages/1/edit').to route_to('manage/stages#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/manage/stages').to route_to('manage/stages#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/manage/stages/1').to route_to('manage/stages#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/manage/stages/1').to route_to('manage/stages#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/manage/stages/1').to route_to('manage/stages#destroy', id: '1')
    end
  end
end

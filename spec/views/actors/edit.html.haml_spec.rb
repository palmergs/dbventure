# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'actors/edit', type: :view do
  let(:actor) { create(:actor) }

  before(:each) do
    assign(:actor, actor)
  end

  it 'renders the edit actor form' do
    render
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'items/index', type: :view do
  before(:each) do
    item1 = create(:item)
    item2 = create(:item)
    assign(:items, [ item1, item2 ])
  end

  it 'renders a list of items' do
    render
  end
end

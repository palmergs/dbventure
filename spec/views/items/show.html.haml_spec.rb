# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'items/show', type: :view do
  before(:each) do
    assign(:item, Item.create!(
                    name: 'Name',
                    description: 'Description'
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end

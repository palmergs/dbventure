require 'rails_helper'

RSpec.describe 'props/index', type: :view do
  before(:each) do
    prop1 = create(:prop)
    prop2 = create(:prop, item: prop1.item)
    assign(:props, [prop1, prop2])
  end

  it 'renders a list of props' do
    render
  end
end

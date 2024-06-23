require 'rails_helper'

RSpec.describe 'passages/index', type: :view do
  before(:each) do
    north = create(:passage, direction: 'North')
    south = create(:passage, from: north.to, to: north.from, direction: 'South')
    assign(:passages, [north, south])
  end

  it 'renders a list of passages' do
    render
  end
end

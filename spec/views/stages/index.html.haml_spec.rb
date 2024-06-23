require 'rails_helper'

RSpec.describe 'stages/index', type: :view do
  before(:each) do
    assign(:stages, [create(:stage), create(:stage)])
  end

  it 'renders a list of stages' do
    render
  end
end

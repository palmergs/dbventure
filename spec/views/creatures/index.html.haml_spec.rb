require 'rails_helper'

RSpec.describe 'creatures/index', type: :view do
  before(:each) do
    assign(:creatures, [create(:creature), create(:creature)])
  end

  it 'renders a list of creatures' do
    render
  end
end

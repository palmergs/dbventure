require 'rails_helper'

RSpec.describe 'props/show', type: :view do
  before(:each) do
    assign(:prop, create(:prop))
  end

  it 'renders attributes in <p>' do
    render
  end
end

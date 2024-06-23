require 'rails_helper'

RSpec.describe 'props/edit', type: :view do
  let(:prop) { create(:prop) }

  before(:each) do
    assign(:prop, prop)
  end

  it 'renders the edit prop form' do
    render
  end
end

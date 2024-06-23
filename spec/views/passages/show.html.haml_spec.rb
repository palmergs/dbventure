require 'rails_helper'

RSpec.describe 'passages/show', type: :view do
  before(:each) do
    assign(:passage, create(:passage))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Direction/)
  end
end

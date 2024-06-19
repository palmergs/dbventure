require 'rails_helper'

RSpec.describe "props/show", type: :view do
  before(:each) do
    assign(:prop, create(:prop))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slotted Type/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Slots/)
  end
end

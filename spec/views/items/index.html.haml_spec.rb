require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    item1 = create(:item)
    item2 = create(:item)
    assign(:items, [item1, item2])
  end

  it "renders a list of items" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
  end
end

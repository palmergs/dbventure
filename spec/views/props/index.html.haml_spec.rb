require 'rails_helper'

RSpec.describe "props/index", type: :view do
  before(:each) do
    prop1 = create(:prop)
    prop2 = create(:prop, item: prop1.item)
  end

  it "renders a list of props" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Slotted Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Slots".to_s), count: 2
  end
end

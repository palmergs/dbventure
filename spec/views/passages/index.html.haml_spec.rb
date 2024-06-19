require 'rails_helper'

RSpec.describe "passages/index", type: :view do
  before(:each) do
    north = create(:passage, direction: "North")
    south = create(:passage, from: north.to, to: north.from, direction: "South")
    assign(:passages, [ north, south ])
  end

  it "renders a list of passages" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Direction".to_s), count: 2
  end
end

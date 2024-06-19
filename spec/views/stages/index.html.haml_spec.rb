require 'rails_helper'

RSpec.describe "stages/index", type: :view do
  before(:each) do
    assign(:stages, [
      Stage.create!(
        name: "Name",
        description: "MyText"
      ),
      Stage.create!(
        name: "Name",
        description: "MyText"
      )
    ])
  end

  it "renders a list of stages" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end

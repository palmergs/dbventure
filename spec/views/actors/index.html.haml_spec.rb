require 'rails_helper'

RSpec.describe "actors/index", type: :view do
  before(:each) do
    act1 = create(:actor)
    act2 = create(:actor, stage: act1.stage, creature: act1.creature)
    assign(:actors, [ act1, act2 ])
  end

  it "renders a list of actors" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end

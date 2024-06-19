require 'rails_helper'

RSpec.describe "props/edit", type: :view do
  let(:prop) { create(:prop) }

  before(:each) do
    assign(:prop, prop)
  end

  it "renders the edit prop form" do
    render

    assert_select "form[action=?][method=?]", prop_path(prop), "post" do

      assert_select "input[name=?]", "prop[item_id]"

      assert_select "input[name=?]", "prop[slotted_id]"

      assert_select "input[name=?]", "prop[slotted_type]"

      assert_select "input[name=?]", "prop[name]"

      assert_select "input[name=?]", "prop[slots]"
    end
  end
end

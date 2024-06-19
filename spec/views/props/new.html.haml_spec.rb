require 'rails_helper'

RSpec.describe "props/new", type: :view do
  before(:each) do
    assign(:prop, build(:prop))
  end

  it "renders new prop form" do
    render

    assert_select "form[action=?][method=?]", props_path, "post" do

      assert_select "input[name=?]", "prop[item_id]"

      assert_select "input[name=?]", "prop[slotted_id]"

      assert_select "input[name=?]", "prop[slotted_type]"

      assert_select "input[name=?]", "prop[name]"

      assert_select "input[name=?]", "prop[slots]"
    end
  end
end

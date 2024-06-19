require 'rails_helper'

RSpec.describe "passages/new", type: :view do
  before(:each) do
    assign(:passage, build(:passage))
  end

  it "renders new passage form" do
    render

    assert_select "form[action=?][method=?]", passages_path, "post" do

      assert_select "input[name=?]", "passage[from_id]"

      assert_select "input[name=?]", "passage[to_id]"

      assert_select "input[name=?]", "passage[name]"

      assert_select "input[name=?]", "passage[direction]"
    end
  end
end

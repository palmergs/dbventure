require 'rails_helper'

RSpec.describe "passages/edit", type: :view do
  let(:passage) { create(:passage) }

  before(:each) do
    assign(:passage, passage)
  end

  it "renders the edit passage form" do
    render

    assert_select "form[action=?][method=?]", passage_path(passage), "post" do

      assert_select "input[name=?]", "passage[from_id]"

      assert_select "input[name=?]", "passage[to_id]"

      assert_select "input[name=?]", "passage[name]"

      assert_select "input[name=?]", "passage[direction]"
    end
  end
end

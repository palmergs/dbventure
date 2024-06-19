require 'rails_helper'

RSpec.describe "creatures/new", type: :view do
  before(:each) do
    assign(:creature, Creature.new(
      name: "MyString",
      description: "MyString"
    ))
  end

  it "renders new creature form" do
    render

    assert_select "form[action=?][method=?]", creatures_path, "post" do

      assert_select "input[name=?]", "creature[name]"

      assert_select "input[name=?]", "creature[description]"
    end
  end
end

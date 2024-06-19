require 'rails_helper'

RSpec.describe "actors/new", type: :view do
  before(:each) do
    assign(:actor, Actor.new(
      stage: nil,
      creature: nil,
      name: "MyString"
    ))
  end

  it "renders new actor form" do
    render

    assert_select "form[action=?][method=?]", actors_path, "post" do

      assert_select "input[name=?]", "actor[stage_id]"

      assert_select "input[name=?]", "actor[creature_id]"

      assert_select "input[name=?]", "actor[name]"
    end
  end
end

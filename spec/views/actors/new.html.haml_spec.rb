require 'rails_helper'

RSpec.describe "actors/new", type: :view do
  before(:each) do
    assign(:actor, build(:actor))
  end

  it "renders new actor form" do
    render
  end
end

require 'rails_helper'

RSpec.describe "props/new", type: :view do
  before(:each) do
    assign(:prop, build(:prop))
  end

  it "renders new prop form" do
    render
  end
end

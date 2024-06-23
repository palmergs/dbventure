require 'rails_helper'

RSpec.describe "passages/edit", type: :view do
  let(:passage) { create(:passage) }

  before(:each) do
    assign(:passage, passage)
  end

  it "renders the edit passage form" do
    render
  end
end

require 'rails_helper'

RSpec.describe "stages/show", type: :view do
  before(:each) do
    assign(:stage, create(:stage))
  end
end

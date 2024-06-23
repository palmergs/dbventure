require 'rails_helper'

RSpec.describe 'passages/new', type: :view do
  before(:each) do
    assign(:passage, build(:passage))
  end

  it 'renders new passage form' do
    render
  end
end

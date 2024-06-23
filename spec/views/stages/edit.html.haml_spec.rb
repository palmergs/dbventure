# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stages/edit', type: :view do
  let(:stage) do
    Stage.create!(
      name: 'MyString',
      description: 'MyText'
    )
  end

  before(:each) do
    assign(:stage, stage)
  end

  it 'renders the edit stage form' do
    render

    assert_select 'form[action=?][method=?]', stage_path(stage), 'post' do
      assert_select 'input[name=?]', 'stage[name]'

      assert_select 'textarea[name=?]', 'stage[description]'
    end
  end
end

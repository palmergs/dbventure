# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'creatures/edit', type: :view do
  let(:creature) do
    Creature.create!(
      name: 'MyString',
      description: 'MyString'
    )
  end

  before(:each) do
    assign(:creature, creature)
  end

  it 'renders the edit creature form' do
    render

    assert_select 'form[action=?][method=?]', creature_path(creature), 'post' do
      assert_select 'input[name=?]', 'creature[name]'

      assert_select 'input[name=?]', 'creature[description]'
    end
  end
end

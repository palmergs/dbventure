# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'can be instantiated' do
    expect(create(:item)).to be_persisted
    expect(create(:item)).to be_persisted
  end

  describe :scopes do
    it :has_props do
      actor = create(:actor)
      item = create(:item)
      expect(item.props.create(slotted: actor)).to be_persisted
    end
  end
end

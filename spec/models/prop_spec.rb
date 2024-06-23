require 'rails_helper'

RSpec.describe Prop, type: :model do
  it 'can be instantiated' do
    expect(create(:prop)).to be_persisted
    expect(create(:prop)).to be_persisted
  end

  describe :slotted do
    let(:stage) { create(:stage) }
    let(:actor) { create(:actor, stage:) }
    let(:item) { create(:item) }

    it 'can be assigned to a actor or a stage' do
      prop = actor.props.create!(item:)
      expect(actor.props).to include(prop)

      prop.update!(slotted: stage)
      expect(stage.props).to include(prop)
    end
  end
end

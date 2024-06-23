# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can be instantiated' do
    expect(create(:user)).to be_persisted
    expect(create(:user)).to be_persisted
  end

  describe :character do
    let(:stage) { create(:stage) }
    let(:creature) { create(:creature, name: 'Dwarf') }
    let(:user) { create(:user) }

    it 'can be assigned to a user' do
      actor = user.actors.create!(name: 'Borg the Barbarian', creature:, stage:)
      expect(user.actors).to include(actor)
      expect(user.character).to be_nil

      user.update!(character: actor)
      expect(user).to_not be_changed
      expect(user.character).to eq(actor)

      user.update!(character: nil)
      expect(user.character).to be_nil
    end

    it 'can not be assigned to two users' do
      actor = user.actors.create!(name: 'Roger the Rogue', creature:, stage:)
      user2 = create(:user)
      user2.update!(character: actor)
      expect(user.actors).to include(actor)
      expect(user2.actors).to_not include(actor)
      expect(user.character).to be_nil
      expect(user2.character).to eq(actor)

      expect do
        user.update!(character: actor)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end

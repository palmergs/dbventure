require 'rails_helper'

RSpec.describe Creature, type: :model do
  it 'can be instantiated' do
    expect(create(:creature)).to be_persisted
    expect(create(:creature)).to be_persisted
  end
end

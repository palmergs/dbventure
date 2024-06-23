require 'rails_helper'

RSpec.describe Prop, type: :model do
  it 'can be instantiated' do
    expect(create(:prop)).to be_persisted
    expect(create(:prop)).to be_persisted
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'can be instantiated' do
    expect(create(:item)).to be_persisted
    expect(create(:item)).to be_persisted
  end
end

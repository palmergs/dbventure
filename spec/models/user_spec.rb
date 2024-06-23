require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can be instantiated' do
    expect(create(:user)).to be_persisted
    expect(create(:user)).to be_persisted
  end
end

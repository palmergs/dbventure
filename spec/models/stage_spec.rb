require 'rails_helper'

RSpec.describe Stage, type: :model do
  it 'can be instantiated' do
    expect(create(:stage)).to be_persisted
    expect(create(:stage)).to be_persisted
  end
end

RSpec.describe Roller do
  it 'returns empty array if attributes are nil' do
    roller = Roller.new()
    expect(roller.roll).to eq []
  end

  it 'returns empty array if all dice pools are empty' do
    roller = Roller.new(Stat::ZERO, Skill::ZERO, Skill::ZERO) 
    expect(roller.roll).to eq []
  end

  it 'generates attribute rolls' do
    roller = Roller.new(Stat::AVERAGE)
    roll = roller.roll
    pp roll
    expect(roll.length).to eq 1
  end

  it 'generates skill rolls' do
    roller = Roller.new(Stat::ZERO, Skill::PROFICIENT)
    roll = roller.roll
    pp roll
    expect(roll.length).to be >= 2
  end

  it 'generates magic rolls' do
    roller = Roller.new(Stat::ZERO, Skill::ZERO, Skill::PROFICIENT)
    roll = roller.roll
    pp roll
    expect(roll.length).to be >= 2
  end

  it 'generates combined rolls' do
    roller = Roller.new(Stat::AVERAGE, Skill::PROFICIENT, Skill::AMATEUR)
    roll = roller.roll
    pp roll
    expect(roll.length).to be >= 5
  end

  it 'drops the lowest values' do
    roller = Roller.new(Stat::ZERO, Dice::Pool.new(6,1))
    roller << Dice::Bonus.new(:skill, :tests)
    roller << Dice::Bonus.new(:skill, :tests)
    roll = roller.roll
    dropped = roll.select {|r| r.dropped }
    expect(dropped.length).to eq(2)
  end
end

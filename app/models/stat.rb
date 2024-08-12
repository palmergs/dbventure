module Stat
  BRAWN = :brawn
  GRACE = :grace
  SMART = :smart
  CHARM = :charm
  FAITH = :faith

  ZERO = Dice::Pool.new(0,0)
  TERRIBLE = Dice::Pool.new(Dice::D4,0)
  POOR = Dice::Pool.new(Dice::D4,1)
  AVERAGE = Dice::Pool.new(Dice::D6,1)
  IMPROVED = Dice::Pool.new(Dice::D8,1)
  EXTRAORDINARY = Dice::Pool.new(Dice::D10,1)
  LEGENDARY = Dice::Pool.new(Dice::D12,1)

  DEFAULT_BRAWN_BY_SIZE = {
    Size::MINUTE => nil,
    Size::TINY => Dice::Pool.new(Dice::D4,0),
    Size::SMALL => Dice::Pool.new(Dice::D4,1),
    Size::MEDIUM => Dice::Pool.new(Dice::D6,1),
    Size::LARGE => Dice::Pool.new(Dice::D6,2),
    Size::HUGE => Dice::Pool.new(Dice::D6,3),
    Size::GIANT => Dice::Pool.new(Dice::D6,4),
    Size::GARGANTUAN => Dice::Pool.new(Dice::D6,5)
  }

  DEFAULT_GRACE_BY_SIZE = {
    Size::MINUTE => Dice::Pool.new(Dice::D6,4),
    Size::TINY => Dice::Pool.new(Dice::D6,3),
    Size::SMALL => Dice::Pool.new(Dice::D6,2),
    Size::MEDIUM => Dice::Pool.new(Dice::D6,1),
    Size::LARGE => Dice::Pool.new(Dice::D6,1),
    Size::HUGE => Dice::Pool.new(Dice::D4,1),
    Size::GIANT => Dice::Pool.new(Dice::D4,1),
    Size::GARGANTUAN => Dice::Pool.new(Dice::D4,0),
  }

end

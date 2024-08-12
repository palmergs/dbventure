module Skill
  ZERO = Dice::Pool::new(0, 0)
  TALENT = Dice::Pool.new(Dice::D4,1)
  AMATEUR = Dice::Pool.new(Dice::D4,2)
  PROFICIENT = Dice::Pool.new(Dice::D6,2)
  SKILLED = Dice::Pool.new(Dice::D8,2)
  EXPERT = Dice::Pool.new(Dice::D10,2)
  MASTER = Dice::Pool.new(Dice::D12,2)
  LEGENDARY = Dice::Pool.new(Dice::D20,2)

  POOL_BY_LEVEL = {
    talent: TALENT,
    amateur: AMATEUR,
    proficient: PROFICIENT,
    skilled: SKILLED,
    expert: EXPERT,
    master: MASTER,
    legendary: LEGENDARY,
  }

  LEVELS = POOL_BY_LEVEL.keys
end

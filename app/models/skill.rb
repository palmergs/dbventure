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

  BLOCK = :block # stop attacks
  DODGE = :dodge # avoid attacks
  POISE = :poise # resistence to influence
  AEGIS = :aegis # resistence to magic
  SENSE = :sense # unconscious awareness
  DEFENSIVE = %i[block dodge poise aegis sense]

  MELEE = :melee
  PUNCH = :punch
  THROW = :throw
  SHOOT = :shoot
  BRAWLER = %i[block melee punch throw shoot]

  STEAL = :steal # pick pockets or locks
  SNEAK = :sneak # hide or move quietly
  SCOUT = :scout # observe an area
  CLIMB = :climb # scale a surface
  SNEAKER = %i[dodge steal sneak scout climb]

  ARGUE = :argue # convince someone of something
  BLUFF = :bluff # lie or deceive
  STUDY = :study # learn about something you can see or hear
  MOUNT = :mount # ride a mount
  TALKER = %i[sense argue bluff study mount]

  SCOUR = :scour # actively search an area
  GLYPH = :glyph # craft magical glyphs to power spells
  LEARN = :learn # lean the properties or history of something
  CRAFT = :craft # build an object
  THINKER = %i[aegis scour glyph learn craft]

  NURSE = :nurse # first aid or long term care
  RITES = :rites # perform a conjuration ritual
  PROBE = :probe # gain insight into a person or object
  AWARE = :aware # notice something unusual
  BELIEVER = %i[poise nurse rites probe aware]

end

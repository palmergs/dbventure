class Roller
  attr_accessor :attr, :skill, :magic

  def initialize attr=nil, level=nil, skill=nil, talent=nil, magic=nil
    @attr = attr
    @level = level
    @skill = skill
    @talent = talent
    @magic = magic
    
    @baps = []
    @adjs = Hash.new(0)
  end

  def << bap
    @baps << bap
    @adjs[bap.category] += bap.adjust
  end

  def bonuses_and_penalties
    @baps
  end

  def bonuses
    @baps.select {|b| b.adjust.positive? }
  end

  def penalties
    @baps.select {|p| p.adjust.negative? }
  end

  def roll
    return [] if attr.nil?

    results = roll_dice(:attr, attr, explode: false, bap: @adjs[:attr])
    results += roll_dice(:level, level, explode: false, bap: @adjs[:level]) unless level.nil?
    results += roll_dice(:skill, skill, explode: true, bap: @adjs[:skill]) unless skill.nil?
    resutls += roll_dice(:talent, talent, explode: false, bap: @adjs[:talent]) unless talent.nil?
    results += roll_dice(:magic, magic, explode: true, bap: @adjs[:magic]) unless magic.nil?
    results
  end

  def roll_dice category, pool, explode: false, bap: 0
    return [] if pool.nil? || pool.count.zero?

    # add bonus / penalty dice to array
    dice_count = pool.count + bap.abs

    # roll dice
    rolls = (0...dice_count).to_a.map { pool.roll }

    # how many dice to drop due to bonuses and penalties
    drop = bap.positive? ? rolls.min(bap.abs) : rolls.max(bap.abs)

    # map 
    rolls.map do |n|
      if n.in?(drop) && bap.positive?
        bap -= 1
        Dice::Roll.new(category, pool.base, n, true, false)
      elsif n.in?(drop) && bap.negative?
        bap += 1
        Dice::Roll.new(category, pool.base, n, true, false)
      else
        roll_result(category, pool, n, explode:)
      end
    end.flatten
  end

  def roll_result category, pool, roll, explode: false
    results = []
    results << Dice::Roll.new(category, pool.base, roll, false, false)
    if explode
      while roll == pool.base do
        roll = pool.roll
        results << Dice::Roll.new(category, pool.base, roll, false, true)
      end
    end
    results
  end
end

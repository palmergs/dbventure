module Dice
  D4 = 4
  D6 = 6
  D8 = 8
  D10 = 10
  D12 = 12
  D20 = 20

  Pool = Data.define(:base, :count) do
    def dice
      Array.new(count, base)
    end

    def roll
      1 + rand(base)
    end

    def to_a
      [base, count]
    end
  end

  Roll = Data.define(:pool, :base, :roll, :dropped, :bonus) do
    def hit?
      !dropped && roll >= 4
    end

    def to_h
      {pool:, base:, roll:, hit: hit?, dropped:, bonus:}
    end
  end

  Penalty = Data.define(:category, :source) do
    def adjust
      1
    end

    def to_h
      { name: :penalty, category:, source: }
    end
  end

  Bonus = Data.define(:category, :source) do
    def adjust
      -1
    end

    def to_h
      { name: :bonus, category:, source: }
    end
  end
end

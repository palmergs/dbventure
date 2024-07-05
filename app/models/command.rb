class Command < ApplicationRecord
  enum command: %i[attack
                   apply
                   cast
                   clean
                   climb
                   close
                   craft
                   drink
                   drop
                   eat
                   engrave
                   examine
                   get
                   insult
                   leave
                   look
                   mix
                   move
                   offer
                   open
                   pickup
                   praise
                   pray
                   quit
                   read
                   remove
                   rest
                   rub
                   run
                   say
                   speak
                   shoot
                   sip
                   sit
                   sleep
                   store
                   swing
                   target
                   taste
                   taunt
                   throw
                   topple
                   use
                   wait
                   walk
                   wear
                   wield
                   yell
                   zzz], _suffix: 'command'

    enum outcome: %i[attacked
                     killed
                     crafted
                     discovered
                     destroyed], _prefix: 'outcome'

  belongs_to :stage
  belongs_to :user
  belongs_to :actor
  belongs_to :direct, polymorphic: true, optional: true
  belongs_to :indirect, polymorphic: true, optional: true

  validates :command, presence: true

  before_validation on: :create do
    self.actor = self.user.character unless self.actor
    self.stage = self.user.character.stage unless self.stage
  end

  def components
    Prop.where(id: component_ids)
  end

  def execute
    if self.valid?
      if move_command?
        old_stage = self.user.character.stage
        new_stage = self.direct.to
        if old_stage.passages_out.includes(new_stage)
          self.user.character.update(stage: new_stage)
          user.character.broadcast_remove_to old_stage
          user.character.broadcast_append_to new_stage
          return true
        end
      end
    end

    false
  end
end

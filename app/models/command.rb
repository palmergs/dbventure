class Command < ApplicationRecord
  enum command: %i[attack apply
                   broadcast
                   cast clean climb close craft
                   drink drop
                   eat engrave examine
                   get
                   insult
                   leave look
                   mix move
                   offer open
                   pickup praise pray
                   quit
                   read remove rest rub run
                   say speak shoot sip sit sleep store swing
                   target taste taunt throw topple
                   use
                   wait walk wear wield
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
        new_stage = self.direct.to
        if stage.passages_out.includes(new_stage)
          actor.update(stage: new_stage)
          actor.broadcast_remove_to stage
          broadcast_append_to stage,
                              partial: "notifications/notification",
                              target: "notifications",
                              locals: { message: "#{ actor.name } has left" }
          actor.broadcast_append_to new_stage
          broadcast_append_to new_stage,
                              partial: "notifications/notification",
                              target: "notifications",
                              locals: { message: "#{ actor.name } has arrived" }
          return true
        end
      end
    end

    false
  end
end

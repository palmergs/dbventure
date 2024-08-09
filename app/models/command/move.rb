class Command::Move < Command
  def execute_command
    new_stage = self.direct.to
    return Command::Outcome.new(false, false) unless stage.passages_out.includes(new_stage)
    return Command::Outcome.new(false, false) unless actor.alive? and actor.mobile?

    self.actor.broadcast_remove_to self.stage

    broadcast_append_to stage,
        partial: "notifications/notification",
        target: "stage_#{ stage.id }_notifications",
        locals: { message: "#{ actor.name } has left" }

    actor.update(stage: new_stage)
    self.actor.broadcast_append_to new_stage, 
        target: "stage_#{ new_stage.id }_actors",
        locals: { actor: self.actor, character: Actor.new }

    broadcast_append_to new_stage,
        partial: "notifications/notification",
        target: "stage_#{ new_stage.id }_notifications",
        locals: { message: "#{ actor.name } has arrived" }

    Command::Result.new(true)
  end
end

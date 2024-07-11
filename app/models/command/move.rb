class Command::Move < Command
  def execute_command
    new_stage = self.direct.to
    return false unless stage.passages_out.includes(new_stage)
    return false unless actor.alive? and actor.mobile?

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
   
    Rails.logger.info("*** Returning true from execute command")
    true
  end
end

class Command::Equip < Command
  def execute_command
    target = self.direct
    broadcast_append_to self.stage,
                        partial: "notifications/notification",
                        target: "notifications",
                        locals: { message: "#{ self.actor.name } attacked #{ target.name }" }
    Command::Result.new(false)
  end
end

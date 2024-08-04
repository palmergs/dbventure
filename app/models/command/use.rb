class Command::Use < Command
  def execute_command
    prop = self.direct
    broadcast_append_to self.stage,
        partial: "notifications/notification",
        target: "notifications",
        locals: { message: "#{ self.actor.name } used #{ prop.name }" }

    Command::Result.new(false)
  end
end

class Command::Steal < Command
  def execute_command
    prop = self.direct
    victim = self.indirect
    broadcast_append_to self.stage,
                        partial: "notifications/notification",
                        target: "notifications",
                        locals: { message: "#{ self.actor.name } stole #{ prop.name } from #{ victim.name }" }

    Command::Result.new(false)
  end
end


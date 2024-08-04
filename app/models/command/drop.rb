class Command::Drop < Command
  def execute_command
    prop = self.direct
    prop.broadcast_remove_to self.actor
    prop.delete

    new_prop = self.stage.props.create(item: prop.item)
    new_prop.broadcast_append_to self.stage,
        partial: "props/prop",
        target: :props,
        locals: { prop: prop, character: self.actor }
    broadcast_append_to self.stage,
        partial: "notifications/notification",
        target: "notifications",
        locals: { message: "#{ self.actor.name } dropped a #{ new_prop.name }" }

    Command::Result.new(false)
  end
end

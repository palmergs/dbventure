class Command::Get < Command
  def execute_command
    prop = self.direct
    prop.broadcast_remove_to self.stage
    prop.delete

    new_prop = self.actor.props.create(item: prop.item)
    new_prop.broadcast_append_to self.actor,
        partial: "props/prop",
        target: "actor_#{ self.actor.id }_props",
        locals: { prop: new_prop, character: self.actor, for_stage: false }

    broadcast_append_to self.stage,
        partial: "notifications/notification",
        target: "stage_#{ self.stage.id }_notifications",
        locals: { message: "#{ self.actor.name } picked up a #{ new_prop.name }" }

    Command::Result.new(false)
  end
end

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


    if new_stage.actors.present?
      Rails.logger.debug("There are actors here when #{ actor.name } gets here...")
      new_stage.actors.each do |actor|
        unless actor.user
          if rand > 0.8
            to = new_stage.passages_out.sample
            Rails.logger.debug("Actor #{ actor } is going to move to #{ to }")
            broadcast_append_to new_stage,
                partial: 'notifications/notification',
                target: "stage_#{ new_stage.id }_notifications",
                locals: { message: "#{ actor.name } begins moving towards the #{ to.name }" }
            NotificationJob.set(wait: 1.second).perform_later(message: "#{ actor.name } is heading towards the #{ to.name }", stage_id: to.from_id)
            NotificationJob.set(wait: 2.second).perform_later(message: "#{ actor.name } is heading towards here", stage_id: to.to_id)
            MoveCommandJob.set(wait: 5.seconds).perform_later(actor_id: actor.id, passage_id: to.id)
          end
        end
      end
    end

    Command::Result.new(true)
  end
end

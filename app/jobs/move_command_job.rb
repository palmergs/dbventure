class MoveCommandJob < ApplicationJob
  queue_as :default

  def perform(actor_id:, passage_id:)
    Rails.logger.debug("In move command...")
    actor = Actor.find(actor_id)
    passage = Passage.find(passage_id)
    if actor.stage != passage.from
      Rails.logger.warn("Actor #{ actor.name } it not at the starting point for passage #{ passage.name }")
    else
      command = Command::Move.new(actor: actor, stage: actor.stage, direct: passage)
      command.execute_command
    end
  end
end

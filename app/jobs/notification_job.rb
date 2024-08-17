class NotificationJob < ApplicationJob
  queue_as :notification

  def perform(message, stage_id = nil)
    Rails.logger.debug("Notification job was called...")
    if stage_id
      stage = Stage.find(stage_id)
      Command.new.broadcast_append_to stage,
                          partial: "notifications/notification",
                          target: "stage_#{ stage_id }_notifications",
                          locals: { message: }
    else
      Stage.all.each do |s|
        Command.new.broadcast_append_to stage,
                            partial: "notifications/notification",
                            target: "stage_#{ s.id }_notifications",
                            locals: { message: }
      end
    end
  end
end

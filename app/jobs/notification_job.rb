class NotificationJob < ApplicationJob
  queue_as :default

  def perform(message, stage_id = nil)
    if stage_id.present?
      stage = Stage.find(stage_id)
      stage.broadcast_append_to stage,
                          partial: "notifications/notification",
                          target: "notifications",
                          locals: { message: }
    else
      Command.new.broadcast_append_to :notifications,
                          partial: "notifications/notification",
                          target: "notifications",
                          locals: { message: }
    end
  end
end

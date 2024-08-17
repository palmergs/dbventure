class HelloJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.warn("HELLO RUNNING A JOB")
    p "What is going on?"
  end
end

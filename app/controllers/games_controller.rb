# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :authenticate_user!

  def show
    @stage = current_user.character.stage
  end

  def update
    @stage = current_user.character.stage
    command = Command.new(create_params)
    command.user = current_user
    if command.execute
      @stage = current_user.character.stage
      render :show 
    else
      Rails.logger.warn("!!! EXECUTE WAS UNSUCCESSFUL :-(")
      Rails.logger.debug(command.inspect)
      command.broadcast_append_to @stage,
                                  partial: "notifications/notification",
                                  target: "notifications",
                                  locals: { message: "Something went wrong..." }
      render :show
    end
  end

  private

  def create_params
    params.permit(:type,
                  :direct_id,
                  :direct_type,
                  :indirect_id,
                  :indirect_type,
                  :count,
                  :comment,
                  component_ids: [],
                  slots: [])
  end
end

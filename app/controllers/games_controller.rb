# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :authenticate_user!

  def show
    @stage = current_user.character.stage
  end

  def update
    @stage = current_user.character.stage
    command = Command.new(create_params)
    if command.move_command? && @stage.passages_out.includes(command.direct)
      @stage = command.direct.to
      current_user.character.update(stage: @stage)
      render :show
    end
  end

  private

  def create_params
    params.permit(:command,
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

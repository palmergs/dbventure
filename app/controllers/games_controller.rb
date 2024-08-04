# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :authenticate_user!

  def show
    @stage = current_user.character.stage
    @character = current_user.character
  end

  def update
    @stage = current_user.character.stage
    command = Command.new(create_params)
    command.user = current_user
    if command.execute
      @stage = current_user.character.stage
      @character = current_user.character
      render :show
    else
      head :ok
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

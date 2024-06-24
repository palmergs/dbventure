# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :authenticate_user!

  def show
    @stage = current_user.character.stage
  end

  def update
    @stage = current_user.character.stage
  end
end

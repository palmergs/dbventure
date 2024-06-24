class Game::ActorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @stage = current_user.character.stage
    @actors = @stage.actors
  end

  def show
    @stage = current_user.character.stage
    @actor = @stage.actors.find(params[:id])
  end
end

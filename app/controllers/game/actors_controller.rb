class Game::ActorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @stage = current_user.character.stage
    @actors = @stage.actors
  end

  def show
    @actor = Actor.find(params[:id])
  end
end

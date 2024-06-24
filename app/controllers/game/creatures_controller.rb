class Game::CreaturesController < ApplicationController
  before_action :authenticate_user!

  def index
    @stage = current_user.character.stage
    @creatures = Creature.all
  end

  def show
    @stage = current_user.character.stage
    @creature = Creature.find(params[:id])
  end
end

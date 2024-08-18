class Game::CreaturesController < ApplicationController
  before_action :authenticate_user!

  def index
    @stage = current_user.character.stage
    @creatures = Creature.all
  end

  def show
    @creature = Creature.find(params[:id])
  end
end

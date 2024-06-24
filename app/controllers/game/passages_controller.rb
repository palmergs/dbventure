class Game::PassagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @stage = current_user.character.stage
    @passages = @stage.passages_out
  end

  def show
    @stage = current_user.character.stage
    @passage = @stage.passages_out.find(params[:id])
  end
end

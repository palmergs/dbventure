class Game::ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @stage = current_user.character.stage
    @items = @stage.items
  end

  def show
    @stage = current_user.character.stage
    @item = @stage.items.find(params[:id])
  end
end

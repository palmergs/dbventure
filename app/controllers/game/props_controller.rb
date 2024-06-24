class Game::PropsController < ApplicationController
  before_action :authenticate_user!

  def index
    @stage = current_user.character.stage
    @props = @stage.props
  end

  def show
    @stage = current_user.character.stage
    @prop = @stage.props.find(params[:id])
  end
end

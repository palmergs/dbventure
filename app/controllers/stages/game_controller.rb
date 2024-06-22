class Stages::GameController < ApplicationController
  def index
    @stage = Stage.find(params[:id])
  end
end

class CharactersController < ApplicationController
  before_action :authenticate_user!

  def index
    @actors = current_user.actors
  end

  def show
    @actor = current_user.actors.find(params[:id])
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

end

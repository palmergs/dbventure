class CharactersController < ApplicationController
  before_action :authenticate_user!

  def index
    @actors = current_user.actors
  end

  def show
    @actor = current_user.actors.find(params[:id])
  end

  def new
    @character = Actor.new(user: current_user)
  end

  def create
    @character = Actor.new(create_params)
    @character.user = current_user
    if @character.save
      redirect_to character_path(@character)
    else
      render :new
    end
  end

  def edit
    @character = current_user.actors.find(params[:id])
  end

  def update
    @character = current_user.actors.find(params[:id])
    if @character.update(update_params.except(:activate))
      if update_params[:activate]
        current_user.update(character: @character)
      end
      redirect_to character_path(@character)
    else
      render :edit
    end
  end

  private

  def create_params
    params.require(:actor).permit(:name, :description, :creature_id)
  end

  def update_params
    params.require(:actor).permit(:name, :description, :creature_id, :activate)
  end
end

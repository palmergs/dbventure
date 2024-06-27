# frozen_string_literal: true

class Manage::ActorsController < ManageController
  before_action :authenticate_user!
  before_action :set_actor, only: %i[show edit update destroy]

  def index
    @actors = Actor.all
  end

  def show; end

  def new
    @actor = Actor.new
  end

  def edit; end

  def create
    @actor = Actor.new(actor_params)

    if @actor.save
      redirect_to [:manage, @actor], notice: "Actor was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @actor.update(actor_params)
      redirect_to [:manage, @actor], notice: "Actor was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @actor.destroy!
    redirect_to manage_actors_url, notice: "Actor was successfully destroyed.", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_actor
    @actor = Actor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def actor_params
    params.require(:actor).permit(:stage_id, :creature_id, :name)
  end
end

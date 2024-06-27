class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    actor = current_user.actors.find(update_params[:actor_id])
    if actor
      current_user.update(character: actor)
    end
    redirect_to profile_path
  end

  private

  def update_params
    params.require(:profile).permit(:actor_id)
  end
end

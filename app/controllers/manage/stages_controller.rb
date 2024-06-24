# frozen_string_literal: true

class Manage::StagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stage, only: %i[show edit update destroy]

  def index
    @stages = Stage.all
  end

  def show; end

  def new
    @stage = Stage.new
  end

  def edit; end

  def create
    @stage = Stage.new(stage_params)

    if @stage.save
      redirect_to @stage, notice: "Stage was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @stage.update(stage_params)
      redirect_to @stage, notice: "Stage was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @stage.destroy!
    redirect_to stages_url, notice: "Stage was successfully destroyed.", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stage
    @stage = Stage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def stage_params
    params.require(:stage).permit(:name, :description)
  end
end

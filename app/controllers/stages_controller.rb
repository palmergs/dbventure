class StagesController < ApplicationController
  before_action :set_stage, only: %i[ show edit update destroy ]

  # GET /stages
  def index
    @stages = Stage.all
  end

  # GET /stages/1
  def show
  end

  # GET /stages/new
  def new
    @stage = Stage.new
  end

  # GET /stages/1/edit
  def edit
  end

  # POST /stages
  def create
    @stage = Stage.new(stage_params)

    if @stage.save
      redirect_to @stage, notice: "Stage was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stages/1
  def update
    if @stage.update(stage_params)
      redirect_to @stage, notice: "Stage was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /stages/1
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

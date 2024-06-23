class CreaturesController < ApplicationController
  before_action :set_creature, only: %i[show edit update destroy]

  # GET /creatures
  def index
    @creatures = Creature.all
  end

  # GET /creatures/1
  def show; end

  # GET /creatures/new
  def new
    @creature = Creature.new
  end

  # GET /creatures/1/edit
  def edit; end

  # POST /creatures
  def create
    @creature = Creature.new(creature_params)

    if @creature.save
      redirect_to @creature, notice: 'Creature was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /creatures/1
  def update
    if @creature.update(creature_params)
      redirect_to @creature, notice: 'Creature was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /creatures/1
  def destroy
    @creature.destroy!
    redirect_to creatures_url, notice: 'Creature was successfully destroyed.', status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_creature
    @creature = Creature.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def creature_params
    params.require(:creature).permit(:name, :description)
  end
end

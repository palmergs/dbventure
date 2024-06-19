class PropsController < ApplicationController
  before_action :set_prop, only: %i[ show edit update destroy ]

  # GET /props
  def index
    @props = Prop.all
  end

  # GET /props/1
  def show
  end

  # GET /props/new
  def new
    @prop = Prop.new
  end

  # GET /props/1/edit
  def edit
  end

  # POST /props
  def create
    @prop = Prop.new(prop_params)

    if @prop.save
      redirect_to @prop, notice: "Prop was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /props/1
  def update
    if @prop.update(prop_params)
      redirect_to @prop, notice: "Prop was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /props/1
  def destroy
    @prop.destroy!
    redirect_to props_url, notice: "Prop was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prop
      @prop = Prop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prop_params
      params.require(:prop).permit(:item_id, :slotted_id, :slotted_type, :name, :slots)
    end
end

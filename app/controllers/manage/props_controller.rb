# frozen_string_literal: true

class Manage::PropsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prop, only: %i[show edit update destroy]

  def index
    @props = Prop.all
  end

  def show; end

  def new
    @prop = Prop.new
  end

  def edit; end

  def create
    @prop = Prop.new(prop_params)

    if @prop.save
      redirect_to [:manage, @prop], notice: "Prop was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @prop.update(prop_params)
      redirect_to [:manage, @prop], notice: "Prop was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @prop.destroy!
    redirect_to manage_props_url, notice: "Prop was successfully destroyed.", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_prop
    @prop = Prop.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def prop_params
    params.require(:prop).permit(:item_id, :slotted_id, :slotted_type, :name, :description, :slots_str)
  end
end

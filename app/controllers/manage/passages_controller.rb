# frozen_string_literal: true

class Manage::PassagesController < ManageController
  before_action :authenticate_user!
  before_action :set_passage, only: %i[show edit update destroy]

  def index
    @passages = Passage.all
  end

  def show; end

  def new
    @passage = Passage.new
  end

  def edit; end

  def create
    @passage = Passage.new(passage_params)

    if @passage.save
      redirect_to [:manage, @passage], notice: "Passage was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @passage.update(passage_params)
      redirect_to [:manage, @passage], notice: "Passage was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /passages/1
  def destroy
    @passage.destroy!
    redirect_to manage_passages_url, notice: "Passage was successfully destroyed.", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_passage
    @passage = Passage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def passage_params
    params.require(:passage).permit(:from_id, :to_id, :name, :direction)
  end
end

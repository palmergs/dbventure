class PassagesController < ApplicationController
  before_action :set_passage, only: %i[ show edit update destroy ]

  # GET /passages
  def index
    @passages = Passage.all
  end

  # GET /passages/1
  def show
  end

  # GET /passages/new
  def new
    @passage = Passage.new
  end

  # GET /passages/1/edit
  def edit
  end

  # POST /passages
  def create
    @passage = Passage.new(passage_params)

    if @passage.save
      redirect_to @passage, notice: "Passage was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /passages/1
  def update
    if @passage.update(passage_params)
      redirect_to @passage, notice: "Passage was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /passages/1
  def destroy
    @passage.destroy!
    redirect_to passages_url, notice: "Passage was successfully destroyed.", status: :see_other
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

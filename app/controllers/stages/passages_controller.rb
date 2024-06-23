# frozen_string_literal: true

module Stages
  class PassagesController < ApplicationController
    def index
      @stage = Stage.find(params[:stage_id])
      @passages = @stage.passages_out
      render "stages/passages/index", layout: false
    end

    def show
      @stage = Stage.find(params[:stage_id])
      @passage = @stage.passages_out.find(params[:id])
      render "stages/passages/show", layout: false
    end
  end
end

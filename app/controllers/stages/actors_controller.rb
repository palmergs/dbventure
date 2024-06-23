# frozen_string_literal: true

module Stages
  class ActorsController < ApplicationController
    def index
      @stage = Stage.find(params[:stage_id])
      @actors = @stage.actors
      render "stages/actors/index", layout: false
    end

    def show
      @stage = Stage.find(params[:stage_id])
      @actor = @stage.actors.find(params[:id])
      render "stages/actors/show", layout: false
    end
  end
end

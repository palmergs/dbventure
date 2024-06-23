# frozen_string_literal: true

module Stages
  class GameController < ApplicationController
    def index
      @stage = Stage.find(params[:id])
    end
  end
end

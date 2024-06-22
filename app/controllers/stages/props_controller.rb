class Stages::PropsController < ApplicationController
  def index
    @stage = Stage.find(params[:stage_id])
    @props = @stage.props
    render "stages/props/index", layout: false
  end

  def show
    @stage = Stage.find(params[:stage_id])
    @prop = Prop.find(params[:id])
    render "stages/props/show", layout: false
  end
end

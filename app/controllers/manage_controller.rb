class ManageController < ApplicationController
  before_action :authenticate_user!
  layout "manage"

  def index
  end
end

class AddStartFlagToStage < ActiveRecord::Migration[7.1]
  def change
    add_column :stages, :start_location, :bool, null: false, default: false
  end
end

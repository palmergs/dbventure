class AddStageToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :stage_id, :bigint, null: true
  end
end

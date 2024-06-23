class AddUserToActor < ActiveRecord::Migration[7.1]
  def change
    add_reference :actors, :user, null: true
    add_column :users, :character_id, :bigint, null: true

    add_index :users, :character_id, unique: true
  end
end

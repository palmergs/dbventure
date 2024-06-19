class CreateStages < ActiveRecord::Migration[7.1]
  def change
    create_table :stages do |t|
      t.string :name, null: false
      t.text :description, null: false, default: ''

      t.timestamps
    end
  end
end

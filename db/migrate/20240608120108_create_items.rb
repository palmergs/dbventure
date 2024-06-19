class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description, null: false, default: ''

      t.timestamps
    end
  end
end

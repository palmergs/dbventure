class CreatePassages < ActiveRecord::Migration[7.1]
  def change
    create_table :passages do |t|
      t.references :from, null: false, foreign_key: { to_table: :stages }, index: true
      t.references :to, null: false, foreign_key: { to_table: :stages }, index: true
      t.string :name, null: false
      t.text :description, null: false, default: ''
      t.string :direction, null: false

      t.timestamps
    end
  end
end

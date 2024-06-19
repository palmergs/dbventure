class CreateActors < ActiveRecord::Migration[7.1]
  def change
    create_table :actors do |t|
      t.belongs_to :stage, null: false, foreign_key: true, index: true
      t.belongs_to :creature, null: false, foreign_key: true, index: true
      t.string :name, null: false
      t.text :description, null: false, default: ''

      t.timestamps
    end
  end
end

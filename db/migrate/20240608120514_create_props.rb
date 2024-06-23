# frozen_string_literal: true

class CreateProps < ActiveRecord::Migration[7.1]
  def change
    create_table :props do |t|
      t.belongs_to :item, null: false, foreign_key: true, index: true
      t.references :slotted, polymorphic: true, null: false
      t.string :name, null: false
      t.text :description, null: false, default: ''
      t.string :slots, null: false, array: true, default: []

      t.timestamps
    end

    add_index :props, %i[slotted_id slotted_type]
  end
end

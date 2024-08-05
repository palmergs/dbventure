class CreateCommands < ActiveRecord::Migration[7.1]
  def change
    create_enum :outcome_enum, %i[attacked
                                  killed
                                  crafted
                                  built
                                  discovered
                                  destroyed]

    create_table :commands do |t|
      t.string :type, null: false
      t.references :stage, null: false, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true
      t.references :actor, null: false, foreign_key: true, index: true
      t.references :direct, polymorphic: true, null: true
      t.references :indirect, polymorphic: true, null: true

      # prop_ids for use in build/craft commands
      t.bigint :component_ids, null: false, array: true, default: []
      t.integer :count, null: false, default: 0
      t.string :comment, null: true

      # when attempting to wear/wield a prop
      t.string :slots, null: false, array: true, default: []
      t.enum :outcome, enum_type: :outcome_enum, null: false, index: true

      t.timestamps
    end

    add_index :commands, %i[id type]
    add_index :commands, %i[actor_id outcome]
    add_index :commands, %i[direct_id direct_type]
    add_index :commands, %i[indirect_id indirect_type]
  end
end

class CreateCommands < ActiveRecord::Migration[7.1]
  def change
    create_enum :command_enum, %i[attack
                                  apply
                                  cast
                                  clean
                                  climb
                                  close
                                  craft
                                  drink
                                  drop
                                  eat
                                  engrave
                                  examine
                                  get
                                  insult
                                  leave
                                  look
                                  mix
                                  move
                                  offer
                                  open
                                  pickup
                                  praise
                                  pray
                                  quit
                                  read
                                  remove
                                  rest
                                  rub
                                  run
                                  say
                                  speak
                                  shoot
                                  sip
                                  sit
                                  sleep
                                  store
                                  swing
                                  target
                                  taste
                                  taunt
                                  throw
                                  topple
                                  use
                                  wait
                                  walk
                                  wear
                                  wield
                                  yell
                                  zzz]


    create_enum :outcome_enum, %i[attacked
                                  killed
                                  crafted
                                  discovered
                                  destroyed]

    create_table :commands do |t|
      t.references :stage, null: false, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true
      t.references :actor, null: false, foreign_key: true, index: true
      t.enum :command, enum_type: :command_enum, null: false, index: true
      t.references :direct, polymorphic: true, null: true
      t.references :indirect, polymorphic: true, null: true
      t.bigint :component_ids, null: false, array: true, default: []
      t.integer :count, null: false, default: 0
      t.string :comment, null: true
      t.string :slots, null: false, array: true, default: []
      t.enum :outcome, enum_type: :outcome_enum, null: false, index: true

      t.timestamps
    end

    add_index :commands, %i[direct_id direct_type]
    add_index :commands, %i[indirect_id indirect_type]
  end
end

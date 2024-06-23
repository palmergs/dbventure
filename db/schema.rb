# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_23_025355) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.bigint "stage_id", null: false
    t.bigint "creature_id", null: false
    t.string "name", null: false
    t.text "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["creature_id"], name: "index_actors_on_creature_id"
    t.index ["stage_id"], name: "index_actors_on_stage_id"
    t.index ["user_id"], name: "index_actors_on_user_id"
  end

  create_table "creatures", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passages", force: :cascade do |t|
    t.bigint "from_id", null: false
    t.bigint "to_id", null: false
    t.string "name", null: false
    t.text "description", default: "", null: false
    t.string "direction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_id"], name: "index_passages_on_from_id"
    t.index ["to_id"], name: "index_passages_on_to_id"
  end

  create_table "props", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.string "slotted_type", null: false
    t.bigint "slotted_id", null: false
    t.string "name", null: false
    t.text "description", default: "", null: false
    t.string "slots", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_props_on_item_id"
    t.index ["slotted_id", "slotted_type"], name: "index_props_on_slotted_id_and_slotted_type"
    t.index ["slotted_type", "slotted_id"], name: "index_props_on_slotted"
  end

  create_table "stages", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.bigint "character_id"
    t.index ["character_id"], name: "index_users_on_character_id", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "actors", "creatures"
  add_foreign_key "actors", "stages"
  add_foreign_key "passages", "stages", column: "from_id"
  add_foreign_key "passages", "stages", column: "to_id"
  add_foreign_key "props", "items"
end

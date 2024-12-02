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

ActiveRecord::Schema[8.0].define(version: 2024_12_01_130006) do
  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "notes_category_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notes_category_id"], name: "index_notes_on_notes_category_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "notes_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "share_notes", force: :cascade do |t|
    t.integer "note_id", null: false
    t.integer "shared_by_id", null: false
    t.integer "shared_with_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_share_notes_on_note_id"
    t.index ["shared_by_id"], name: "index_share_notes_on_shared_by_id"
    t.index ["shared_with_id"], name: "index_share_notes_on_shared_with_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "notes", "notes_categories"
  add_foreign_key "notes", "users"
  add_foreign_key "share_notes", "notes"
  add_foreign_key "share_notes", "users", column: "shared_by_id"
  add_foreign_key "share_notes", "users", column: "shared_with_id"
end

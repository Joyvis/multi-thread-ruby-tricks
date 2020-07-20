# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_20_013015) do

  create_table "bank_accounts", force: :cascade do |t|
    t.string "description"
    t.string "code"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.integer "source_account_id"
    t.integer "target_account_id"
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["source_account_id"], name: "index_transfers_on_source_account_id"
    t.index ["target_account_id"], name: "index_transfers_on_target_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "identification_document"
    t.date "birthdate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "transfers", "accounts", column: "source_account_id"
  add_foreign_key "transfers", "accounts", column: "target_account_id"
end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_02_030015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "installments", force: :cascade do |t|
    t.bigint "entity_id"
    t.bigint "user_id"
    t.bigint "receiver_id"
    t.decimal "total"
    t.integer "number_of_installments"
    t.decimal "value"
    t.boolean "recorded", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_installments_on_entity_id"
    t.index ["receiver_id"], name: "index_installments_on_receiver_id"
    t.index ["user_id"], name: "index_installments_on_user_id"
  end

  create_table "ledgers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "kind"
    t.decimal "value"
    t.bigint "entity_id"
    t.bigint "receiver_id"
    t.string "note"
    t.boolean "paid", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_ledgers_on_entity_id"
    t.index ["receiver_id"], name: "index_ledgers_on_receiver_id"
    t.index ["user_id"], name: "index_ledgers_on_user_id"
  end

  create_table "receivers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recurrences", force: :cascade do |t|
    t.bigint "entity_id"
    t.decimal "value"
    t.integer "version"
    t.string "frequency"
    t.integer "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_recurrences_on_entity_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "installments", "entities"
  add_foreign_key "installments", "receivers"
  add_foreign_key "installments", "users"
  add_foreign_key "ledgers", "entities"
  add_foreign_key "ledgers", "receivers"
  add_foreign_key "ledgers", "users"
  add_foreign_key "recurrences", "entities"
end

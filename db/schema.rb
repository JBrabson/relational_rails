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

ActiveRecord::Schema.define(version: 2021_05_15_040329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auto_dealerships", force: :cascade do |t|
    t.string "name"
    t.boolean "preowned_sales"
    t.boolean "foreign_inventory"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "automobiles", force: :cascade do |t|
    t.boolean "preowned"
    t.integer "year"
    t.string "make"
    t.string "model"
    t.string "color"
    t.boolean "automatic"
    t.string "engine"
    t.integer "horsepower"
    t.integer "cylinders"
    t.string "drive_train"
    t.decimal "price"
    t.integer "seating_capacity"
    t.bigint "auto_dealership_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auto_dealership_id"], name: "index_automobiles_on_auto_dealership_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "team_id"
    t.string "name"
    t.integer "age"
    t.boolean "healthy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.boolean "champion"
    t.integer "wins"
  end
  
  create_table "instruments", force: :cascade do |t|
    t.string "kind"
    t.boolean "rent_to_own"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "music_store_id"
    t.index ["music_store_id"], name: "index_instruments_on_music_store_id"
  end

  create_table "music_stores", force: :cascade do |t|
    t.string "name"
    t.boolean "rents"
    t.integer "lesson_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "automobiles", "auto_dealerships"

  add_foreign_key "players", "teams"

  add_foreign_key "instruments", "music_stores"

end

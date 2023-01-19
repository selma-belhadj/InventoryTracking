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

ActiveRecord::Schema[7.0].define(version: 2023_01_19_220441) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "item_locations", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "item_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_locations_on_item_id"
    t.index ["location_id", "item_id"], name: "index_item_locations_on_location_id_and_item_id", unique: true
    t.index ["location_id"], name: "index_item_locations_on_location_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "item_locations", "items"
  add_foreign_key "item_locations", "locations"
end

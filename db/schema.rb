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

ActiveRecord::Schema.define(version: 2020_07_01_174836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_makes", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100, null: false
  end

  create_table "car_models", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100, null: false
  end

  create_table "drive_lines", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100, null: false
  end

  create_table "engine_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.integer "drive_line_id"
    t.integer "transmission_type_id"
  end

  create_table "engines", id: :serial, force: :cascade do |t|
    t.integer "horsepower", limit: 2, null: false
    t.integer "torque", limit: 2, null: false
  end

  create_table "fuel_types", id: :serial, force: :cascade do |t|
    t.integer "city_mpg", limit: 2, null: false
    t.string "name", limit: 100, null: false
    t.integer "hwy_mpg", limit: 2, null: false
  end

  create_table "transmission_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100, null: false
  end

  create_table "transmissions", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vehicles", id: :serial, force: :cascade do |t|
    t.integer "year", limit: 2, null: false
    t.integer "make_id"
    t.integer "model_id"
    t.integer "engine_type_id"
    t.integer "fuel_type_id"
    t.integer "transmission_id"
    t.integer "engine_id"
  end

  add_foreign_key "engine_types", "drive_lines", name: "engine_types_drive_line_id_fkey"
  add_foreign_key "engine_types", "transmission_types", name: "engine_types_transmission_type_id_fkey"
  add_foreign_key "vehicles", "car_makes", column: "make_id", name: "vehicles_make_id_fkey"
  add_foreign_key "vehicles", "car_models", column: "model_id", name: "vehicles_model_id_fkey"
  add_foreign_key "vehicles", "engine_types", name: "vehicles_engine_type_id_fkey"
  add_foreign_key "vehicles", "engines", name: "vehicles_engine_id_fkey"
  add_foreign_key "vehicles", "fuel_types", name: "vehicles_fuel_type_id_fkey"
  add_foreign_key "vehicles", "transmissions", name: "vehicles_transmission_id_fkey"
end

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

ActiveRecord::Schema.define(version: 2020_06_29_203715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_models", force: :cascade do |t|
    t.string "car_model"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.boolean "admin", default: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "vehicle_id"
    t.decimal "price", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "makes", force: :cascade do |t|
    t.string "make_name"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "make_id"
    t.integer "car_model_id"
    t.integer "year", limit: 2
    t.string "engine_driveline"
    t.string "engine_type"
    t.string "engine_transmission"
    t.string "engine_horsepower"
    t.string "engine_torque"
    t.string "fuel_type"
    t.string "city_mpg"
    t.string "highway_mpg"
    t.string "classification"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

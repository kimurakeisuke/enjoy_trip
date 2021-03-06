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

ActiveRecord::Schema.define(version: 2020_10_19_060936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "travel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["travel_id"], name: "index_favorites_on_travel_id"
    t.index ["user_id", "travel_id"], name: "index_favorites_on_user_id_and_travel_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "travel_details", force: :cascade do |t|
    t.string "image"
    t.text "content"
    t.bigint "travel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["travel_id"], name: "index_travel_details_on_travel_id"
  end

  create_table "travels", force: :cascade do |t|
    t.string "country", null: false
    t.string "region", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "travel_plan"
    t.integer "travel_detail_id"
    t.integer "favorites_count", default: 0
    t.float "latitude"
    t.float "longitude"
    t.string "city"
    t.string "country_code"
    t.string "continent"
    t.string "area"
    t.index ["user_id"], name: "index_travels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "travels"
  add_foreign_key "favorites", "users"
  add_foreign_key "travel_details", "travels"
  add_foreign_key "travels", "users"
end

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

ActiveRecord::Schema.define(version: 20201030184703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booked_rooms", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "status", null: false
    t.datetime "check_in"
    t.datetime "check_out"
    t.bigint "room_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_booked_rooms_on_customer_id"
    t.index ["room_id"], name: "index_booked_rooms_on_room_id"
    t.index ["start_date", "end_date", "room_id"], name: "index_booked_rooms_on_start_date_and_end_date_and_room_id", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "profile_pic"
    t.text "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["phone_number"], name: "index_customers_on_phone_number", unique: true
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.text "address", null: false
    t.string "contact_number", null: false
    t.string "hotel_pic"
    t.text "amenities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_number"], name: "index_hotels_on_contact_number", unique: true
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", null: false
    t.string "room_type", null: false
    t.string "description"
    t.integer "max_adults", null: false
    t.integer "max_children", null: false
    t.float "price", null: false
    t.text "amenities"
    t.bigint "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "booked_rooms", "customers"
  add_foreign_key "booked_rooms", "rooms"
  add_foreign_key "rooms", "hotels"
end

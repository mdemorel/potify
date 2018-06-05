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

ActiveRecord::Schema.define(version: 2018_06_05_091901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "description"
    t.integer "watering_frequency"
    t.integer "watering_quantity"
    t.integer "potting_frequency"
    t.integer "fertilizing_quantity"
    t.integer "fertilizing_frequency"
    t.string "fertilizing_type"
    t.integer "exposition"
    t.integer "cutting_frequency"
    t.integer "temperature"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "plant_url"
  end

  create_table "pots", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo"
    t.integer "size"
    t.date "adoption_date"
    t.date "last_watering"
    t.date "last_potting"
    t.date "last_fertilizing"
    t.date "last_cutting"
    t.integer "recipient_size"
    t.bigint "user_id"
    t.bigint "plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_pots_on_plant_id"
    t.index ["user_id"], name: "index_pots_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.boolean "completed", default: false
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pot_id"
    t.index ["pot_id"], name: "index_tasks_on_pot_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.integer "age"
    t.string "photo"
    t.integer "points", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "pots", "plants"
  add_foreign_key "pots", "users"
  add_foreign_key "tasks", "pots"
end

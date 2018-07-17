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

ActiveRecord::Schema.define(version: 20180717110903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "child_details", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "age_category"
    t.string "gender"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.integer "age"
    t.string "email"
    t.string "phone_number"
    t.string "passport_number"
    t.string "country_of_issue", default: "France"
    t.string "nationality", default: "French"
    t.integer "language_level"
    t.string "preferred_hobbies"
    t.string "medical_issue"
    t.boolean "smoker?", default: false
    t.text "comment"
    t.bigint "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_clients_on_family_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.integer "family_situation"
    t.string "address_1"
    t.string "address_2"
    t.integer "zip_code"
    t.string "phone"
    t.string "fax"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "qualification_id"
    t.index ["qualification_id"], name: "index_families_on_qualification_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.text "comment"
    t.boolean "prospect?", default: true
    t.boolean "sleeping?", default: false
    t.boolean "client?", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "child_detail_id"
    t.index ["child_detail_id"], name: "index_qualifications_on_child_detail_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clients", "families"
  add_foreign_key "families", "qualifications"
  add_foreign_key "qualifications", "child_details"
end

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

ActiveRecord::Schema.define(version: 20180813193508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camps", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "child_detail_language_stays", force: :cascade do |t|
    t.bigint "potential_language_stay_id"
    t.bigint "child_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_detail_id"], name: "index_child_detail_language_stays_on_child_detail_id"
    t.index ["potential_language_stay_id"], name: "index_child_detail_language_stays_on_potential_language_stay_id"
  end

  create_table "child_details", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "qualification_id"
    t.string "email"
    t.integer "gender"
    t.integer "school_grade"
    t.string "school"
    t.integer "duration"
    t.integer "month"
    t.boolean "client"
    t.index ["qualification_id"], name: "index_child_details_on_qualification_id"
  end

  create_table "clients", force: :cascade do |t|
    t.integer "age_category"
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
    t.integer "first_language_level"
    t.string "preferred_hobbies"
    t.string "medical_issue"
    t.boolean "smoker", default: false
    t.text "comment"
    t.bigint "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address_1"
    t.string "address_2"
    t.integer "zip_code"
    t.date "passport_expiration_date"
    t.integer "second_language_level"
    t.integer "first_language"
    t.integer "second_language"
    t.index ["family_id"], name: "index_clients_on_family_id"
  end

  create_table "correspondences", force: :cascade do |t|
    t.string "reference"
    t.time "start_time"
    t.time "end_time"
    t.string "departure_location"
    t.string "arrival_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "travel_detail_id"
    t.index ["travel_detail_id"], name: "index_correspondences_on_travel_detail_id"
  end

  create_table "employees", force: :cascade do |t|
    t.boolean "main_contact"
    t.string "job_position"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.bigint "partner_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_company_id"], name: "index_employees_on_partner_company_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.integer "family_situation"
    t.string "address_1"
    t.string "address_2"
    t.integer "zip_code"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "qualification_id"
    t.string "email"
    t.string "father_name"
    t.string "mother_name"
    t.string "mother_phone"
    t.string "father_phone"
    t.string "mother_email"
    t.string "father_email"
    t.index ["qualification_id"], name: "index_families_on_qualification_id"
  end

  create_table "generate_pdfs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "application_fee_price_cents"
    t.integer "language_stay_price_cents"
    t.integer "travel_price_cents"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "language_stay_id"
    t.integer "transfer_price_cents"
    t.integer "option_1_price_cents"
    t.integer "option_2_price_cents"
    t.integer "camp_fee_percentage"
    t.integer "camp_fee_amount_price_cents"
    t.integer "camp_fee_total_price_cents"
    t.index ["language_stay_id"], name: "index_invoices_on_language_stay_id"
  end

  create_table "language_stays", force: :cascade do |t|
    t.integer "data_entry_responsible"
    t.integer "commercial_responsible"
    t.integer "duration"
    t.string "activities"
    t.boolean "fee"
    t.bigint "program_id"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "partner_company_id"
    t.string "phone_during_stay"
    t.date "start_date"
    t.date "end_date"
    t.string "location"
    t.string "transfer"
    t.string "pension"
    t.string "accomodation"
    t.string "option_1"
    t.string "option_2"
    t.integer "class_hours"
    t.text "precisions"
    t.index ["client_id"], name: "index_language_stays_on_client_id"
    t.index ["partner_company_id"], name: "index_language_stays_on_partner_company_id"
    t.index ["program_id"], name: "index_language_stays_on_program_id"
  end

  create_table "partner_companies", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "nature"
    t.integer "amount_price_cents"
    t.text "comment"
    t.bigint "invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_payments_on_invoice_id"
  end

  create_table "potential_language_stays", force: :cascade do |t|
    t.integer "nature"
    t.string "countries"
    t.string "partner_companies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.integer "nature"
    t.string "name"
    t.string "address"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.integer "refered_by"
    t.integer "data_entry_responsible"
    t.integer "contact_mode"
    t.string "reference_name"
  end

  create_table "travel_details", force: :cascade do |t|
    t.integer "nature"
    t.boolean "is_correspondence"
    t.integer "mode"
    t.time "meeting_time"
    t.time "start_time"
    t.time "end_time"
    t.string "departure_location"
    t.string "arrival_location"
    t.bigint "partner_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "travel_id"
    t.string "reference"
    t.string "companies"
    t.index ["partner_company_id"], name: "index_travel_details_on_partner_company_id"
    t.index ["travel_id"], name: "index_travel_details_on_travel_id"
  end

  create_table "travels", force: :cascade do |t|
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nature", default: 0
    t.string "travel_code"
    t.bigint "attendant_id"
    t.bigint "language_stay_id"
    t.bigint "travel_group_id"
    t.integer "acheminement"
    t.index ["attendant_id"], name: "index_travels_on_attendant_id"
    t.index ["language_stay_id"], name: "index_travels_on_language_stay_id"
    t.index ["travel_group_id"], name: "index_travels_on_travel_group_id"
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
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "child_detail_language_stays", "child_details"
  add_foreign_key "child_detail_language_stays", "potential_language_stays"
  add_foreign_key "child_details", "qualifications"
  add_foreign_key "clients", "families"
  add_foreign_key "correspondences", "travel_details"
  add_foreign_key "employees", "partner_companies"
  add_foreign_key "families", "qualifications"
  add_foreign_key "invoices", "language_stays"
  add_foreign_key "language_stays", "clients"
  add_foreign_key "language_stays", "partner_companies"
  add_foreign_key "language_stays", "programs"
  add_foreign_key "payments", "invoices"
  add_foreign_key "travel_details", "partner_companies"
  add_foreign_key "travel_details", "travels"
  add_foreign_key "travels", "attendants"
  add_foreign_key "travels", "language_stays"
  add_foreign_key "travels", "travels", column: "travel_group_id"
end

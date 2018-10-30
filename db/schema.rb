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

ActiveRecord::Schema.define(version: 20181030104445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "intl_number"
    t.date "birth_date"
    t.string "address"
    t.string "zip_code"
  end

  create_table "attendants_travel_groups", id: false, force: :cascade do |t|
    t.bigint "travel_group_id", null: false
    t.bigint "attendant_id", null: false
  end

  create_table "camps", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "status"
    t.integer "data_entry_responsible"
    t.integer "contact_mode"
    t.integer "refered_by"
    t.string "reference_name"
    t.integer "commercial_responsible"
    t.integer "follow_up"
    t.boolean "existing_family", default: true
    t.date "birth_date"
    t.index ["qualification_id"], name: "index_child_details_on_qualification_id"
  end

  create_table "child_details_partner_companies", id: false, force: :cascade do |t|
    t.bigint "child_detail_id", null: false
    t.bigint "partner_company_id", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer "age_category"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "email"
    t.string "phone_number"
    t.string "passport_number"
    t.string "country_of_issue", default: "France"
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
    t.string "zip_code"
    t.date "passport_expiration_date"
    t.integer "second_language_level"
    t.integer "first_language"
    t.integer "second_language"
    t.string "intl_number"
    t.integer "school_grade"
    t.string "school"
    t.integer "season"
    t.integer "gender"
    t.string "nationality", default: "French"
    t.integer "client_identifier"
    t.string "country"
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
    t.date "start_date"
    t.date "end_date"
    t.bigint "off_set_travel_id"
    t.index ["off_set_travel_id"], name: "index_correspondences_on_off_set_travel_id"
    t.index ["travel_detail_id"], name: "index_correspondences_on_travel_detail_id"
  end

  create_table "employees", force: :cascade do |t|
    t.boolean "main_contact", default: false
    t.string "job_position"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.bigint "partner_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "intl_number"
    t.index ["partner_company_id"], name: "index_employees_on_partner_company_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.integer "family_situation"
    t.string "address_1"
    t.string "address_2"
    t.string "zip_code"
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
    t.string "mother_intl_number"
    t.string "father_intl_number"
    t.string "intl_number"
    t.string "mother_first_name"
    t.string "father_first_name"
    t.string "mother_office_phone"
    t.string "father_office_phone"
    t.string "mother_office_intl_number"
    t.string "father_office_intl_number"
    t.boolean "prospect", default: false
    t.integer "family_identifier"
    t.string "country"
    t.boolean "mother_main_contact", default: true
    t.boolean "father_main_contact", default: false
    t.string "city"
    t.index ["qualification_id"], name: "index_families_on_qualification_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "language_stay_id"
    t.decimal "application_fee_price_cents", default: "0.0", null: false
    t.string "application_fee_price_currency", default: "EUR", null: false
    t.decimal "language_stay_price_cents", default: "0.0", null: false
    t.string "language_stay_price_currency", default: "EUR", null: false
    t.decimal "travel_price_cents", default: "0.0", null: false
    t.string "travel_price_currency", default: "EUR", null: false
    t.decimal "transfer_price_cents", default: "0.0", null: false
    t.string "transfer_price_currency", default: "EUR", null: false
    t.decimal "option_1_price_cents", default: "0.0", null: false
    t.string "option_1_price_currency", default: "EUR", null: false
    t.decimal "option_2_price_cents", default: "0.0", null: false
    t.string "option_2_price_currency", default: "EUR", null: false
    t.decimal "total_price_cents", default: "0.0", null: false
    t.string "total_price_currency", default: "EUR", null: false
    t.decimal "option_3_price_cents"
    t.string "option_3_price_currency"
    t.index ["language_stay_id"], name: "index_invoices_on_language_stay_id"
  end

  create_table "language_stays", force: :cascade do |t|
    t.integer "data_entry_responsible"
    t.integer "commercial_responsible"
    t.boolean "fee", default: false
    t.bigint "program_id"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "partner_company_id"
    t.date "start_date"
    t.date "end_date"
    t.string "city"
    t.integer "pension"
    t.integer "accomodation"
    t.string "option_1"
    t.string "option_2"
    t.integer "class_hours"
    t.text "precisions"
    t.integer "room"
    t.boolean "canceled_language_stay", default: false
    t.integer "accomodation_type"
    t.boolean "transfer_aller", default: false
    t.boolean "transfer_retour", default: false
    t.string "program_detail"
    t.string "option_1_fr"
    t.string "option_2_fr"
    t.text "program_detail_fr"
    t.string "country"
    t.string "option_3_fr"
    t.string "option_3"
    t.text "other_pension"
    t.text "other_transfer"
    t.boolean "confirmation_language_stay", default: false
    t.boolean "picture", default: false
    t.boolean "family_file", default: false
    t.boolean "school_notes", default: false
    t.boolean "language_test", default: false
    t.boolean "junior_waiver", default: false
    t.boolean "medical_form", default: false
    t.boolean "english_cv", default: false
    t.boolean "motivation_letter", default: false
    t.boolean "agreement_welcome_school", default: false
    t.boolean "justice_record", default: false
    t.boolean "rules_and_regulations", default: false
    t.boolean "teacher_reference", default: false
    t.boolean "passport_cni", default: false
    t.boolean "flight", default: false
    t.boolean "visa", default: false
    t.date "confirmation_language_stay_date"
    t.decimal "duration"
    t.index ["client_id"], name: "index_language_stays_on_client_id"
    t.index ["partner_company_id"], name: "index_language_stays_on_partner_company_id"
    t.index ["program_id"], name: "index_language_stays_on_program_id"
  end

  create_table "off_set_travels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nature"
    t.integer "mode"
    t.boolean "is_correspondence", default: false
    t.string "departure_location"
    t.string "arrival_location"
    t.time "start_time"
    t.time "end_time"
    t.date "start_date"
    t.date "end_date"
    t.time "meeting_time"
    t.string "reference"
    t.bigint "partner_company_id"
    t.bigint "travel_id"
    t.index ["partner_company_id"], name: "index_off_set_travels_on_partner_company_id"
    t.index ["travel_id"], name: "index_off_set_travels_on_travel_id"
  end

  create_table "partner_companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "intl_number"
    t.string "urgence_phone_number"
    t.string "nature"
    t.string "urgence_intl_phone_number"
    t.string "code"
    t.string "country"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "nature"
    t.text "comment"
    t.bigint "invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_price_cents", default: 0, null: false
    t.string "amount_price_currency", default: "EUR", null: false
    t.date "payment_date"
    t.integer "category"
    t.index ["invoice_id"], name: "index_payments_on_invoice_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "program_code"
  end

  create_table "qualifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "prospect", default: true
    t.text "family_comment"
    t.integer "refered_by"
  end

  create_table "state_of_progress_language_stays", force: :cascade do |t|
    t.bigint "language_stay_id"
    t.bigint "state_of_progress_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_stay_id"], name: "index_state_of_progress_language_stays_on_language_stay_id"
    t.index ["state_of_progress_id"], name: "index_state_of_progress_language_stays_on_state_of_progress_id"
  end

  create_table "state_of_progresses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transits", force: :cascade do |t|
    t.integer "nature"
    t.time "start_time"
    t.time "end_time"
    t.date "start_date"
    t.date "end_date"
    t.string "departure_location"
    t.string "arrival_location"
    t.integer "mode"
    t.string "reference"
    t.string "partner_company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transits_travels", force: :cascade do |t|
    t.bigint "transit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "travel_id"
    t.index ["transit_id"], name: "index_transits_travels_on_transit_id"
    t.index ["travel_id"], name: "index_transits_travels_on_travel_id"
  end

  create_table "travel_details", force: :cascade do |t|
    t.integer "nature"
    t.time "start_time"
    t.time "end_time"
    t.date "start_date"
    t.date "end_date"
    t.boolean "is_correspondence", default: false
    t.string "departure_location"
    t.string "arrival_location"
    t.string "reference"
    t.bigint "partner_company_id"
    t.bigint "travel_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "companies"
    t.time "meeting_time"
    t.integer "mode"
    t.bigint "travel_id"
    t.boolean "u_m", default: false
    t.index ["partner_company_id"], name: "index_travel_details_on_partner_company_id"
    t.index ["travel_group_id"], name: "index_travel_details_on_travel_group_id"
    t.index ["travel_id"], name: "index_travel_details_on_travel_id"
  end

  create_table "travel_groups", force: :cascade do |t|
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "travel_code"
    t.integer "season"
  end

  create_table "travels", force: :cascade do |t|
    t.integer "nature"
    t.bigint "language_stay_id"
    t.bigint "travel_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "first_name"
    t.string "last_name"
    t.text "job_description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "child_details", "qualifications"
  add_foreign_key "clients", "families"
  add_foreign_key "correspondences", "off_set_travels"
  add_foreign_key "correspondences", "travel_details"
  add_foreign_key "employees", "partner_companies"
  add_foreign_key "families", "qualifications"
  add_foreign_key "invoices", "language_stays"
  add_foreign_key "language_stays", "clients"
  add_foreign_key "language_stays", "partner_companies"
  add_foreign_key "language_stays", "programs"
  add_foreign_key "off_set_travels", "partner_companies"
  add_foreign_key "off_set_travels", "travels"
  add_foreign_key "payments", "invoices"
  add_foreign_key "state_of_progress_language_stays", "language_stays"
  add_foreign_key "state_of_progress_language_stays", "state_of_progresses"
  add_foreign_key "transits_travels", "transits"
  add_foreign_key "travel_details", "partner_companies"
  add_foreign_key "travel_details", "travel_groups"
  add_foreign_key "travels", "language_stays"
  add_foreign_key "travels", "travel_groups"
end

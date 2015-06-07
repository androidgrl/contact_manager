ActiveRecord::Schema.define(version: 20150607200224) do

  create_table "companies", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_addresses", force: :cascade do |t|
    t.text     "address"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "email_addresses", ["person_id"], name: "index_email_addresses_on_person_id"

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "contact_id"
    t.string   "contact_type"
  end

end

# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150408222720) do

  create_table "countries", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "esp_name",     limit: 255
    t.string   "abbreviation", limit: 255
    t.string   "code",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "districts", force: :cascade do |t|
    t.integer  "province_id", limit: 4
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "districts", ["province_id"], name: "index_districts_on_province_id", using: :btree

  create_table "marital_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.string   "forenames",          limit: 255
    t.string   "surnames",           limit: 255
    t.string   "email",              limit: 255
    t.integer  "sex_id",             limit: 4
    t.integer  "marital_status_id",  limit: 4
    t.date     "birth_date"
    t.string   "professional_title", limit: 255
    t.integer  "nationality_id",     limit: 4
    t.integer  "country_id",         limit: 4
    t.integer  "province_id",        limit: 4
    t.integer  "district_id",        limit: 4
    t.integer  "township_id",        limit: 4
    t.string   "address",            limit: 255
    t.string   "phone_number",       limit: 255
    t.string   "skills",             limit: 255
    t.float    "wage_aspiration",    limit: 24
    t.text     "presentation",       limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "avatar",             limit: 255
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "provinces", force: :cascade do |t|
    t.integer  "country_id", limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "provinces", ["country_id"], name: "index_provinces_on_country_id", using: :btree

  create_table "sexes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "townships", force: :cascade do |t|
    t.integer  "district_id", limit: 4
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "townships", ["district_id"], name: "index_townships_on_district_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",            limit: 255, null: false
    t.string   "crypted_password", limit: 255
    t.string   "salt",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "districts", "provinces"
  add_foreign_key "profiles", "users"
  add_foreign_key "provinces", "countries"
  add_foreign_key "townships", "districts"
end
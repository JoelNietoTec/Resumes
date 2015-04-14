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

ActiveRecord::Schema.define(version: 20150414033455) do

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

  create_table "education_levels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "educative_areas", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.integer  "profile_id",           limit: 4
    t.string   "company",              limit: 255
    t.string   "position",             limit: 255
    t.integer  "professional_area_id", limit: 4
    t.float    "starting_salary",      limit: 24
    t.float    "final_salary",         limit: 24
    t.date     "begin_date"
    t.date     "end_date"
    t.text     "job_description",      limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "experiences", ["profile_id"], name: "index_experiences_on_profile_id", using: :btree

  create_table "marital_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "professional_areas", force: :cascade do |t|
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

  create_table "studies", force: :cascade do |t|
    t.integer  "profile_id",         limit: 4
    t.string   "institution",        limit: 255
    t.string   "title",              limit: 255
    t.integer  "education_level_id", limit: 4
    t.integer  "begin_year",         limit: 4
    t.integer  "end_year",           limit: 4
    t.boolean  "finished",           limit: 1
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "educative_area_id",  limit: 4
  end

  add_index "studies", ["profile_id"], name: "index_studies_on_profile_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

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
  add_foreign_key "experiences", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "provinces", "countries"
  add_foreign_key "studies", "profiles"
  add_foreign_key "townships", "districts"
end

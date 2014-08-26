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

ActiveRecord::Schema.define(version: 20140826200125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ngos", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "contact_city"
    t.string   "contact_country"
    t.string   "contact_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ngos", ["name"], name: "index_ngos_on_name", using: :btree
  add_index "ngos", ["user_id"], name: "index_ngos_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "vacancies", force: true do |t|
    t.integer  "ngo_id"
    t.string   "service"
    t.string   "skill"
    t.string   "work_region"
    t.string   "remote_status"
    t.string   "when_needed"
    t.string   "desc"
    t.string   "title"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language"
  end

  add_index "vacancies", ["is_active"], name: "index_vacancies_on_is_active", using: :btree
  add_index "vacancies", ["ngo_id", "created_at"], name: "index_vacancies_on_ngo_id_and_created_at", using: :btree
  add_index "vacancies", ["remote_status"], name: "index_vacancies_on_remote_status", using: :btree
  add_index "vacancies", ["service"], name: "index_vacancies_on_service", using: :btree
  add_index "vacancies", ["skill"], name: "index_vacancies_on_skill", using: :btree
  add_index "vacancies", ["work_region"], name: "index_vacancies_on_work_region", using: :btree

  create_table "volunteers", force: true do |t|
    t.integer  "user_id"
    t.string   "cause"
    t.string   "work_region"
    t.string   "skill"
    t.string   "availability"
    t.string   "service"
    t.string   "remote_status"
    t.string   "contact_mobile"
    t.string   "contact_city"
    t.string   "contact_country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "volunteers", ["cause"], name: "index_volunteers_on_cause", using: :btree
  add_index "volunteers", ["remote_status"], name: "index_volunteers_on_remote_status", using: :btree
  add_index "volunteers", ["service"], name: "index_volunteers_on_service", using: :btree
  add_index "volunteers", ["user_id", "created_at"], name: "index_volunteers_on_user_id_and_created_at", using: :btree
  add_index "volunteers", ["work_region"], name: "index_volunteers_on_work_region", using: :btree

end

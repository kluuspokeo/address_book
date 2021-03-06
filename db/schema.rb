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

ActiveRecord::Schema.define(version: 20160324004430) do

  create_table "address_tables", force: true do |t|
    t.integer "user_id"
    t.text    "street"
    t.text    "city"
    t.text    "state_code", limit: 255
    t.integer "zip_code"
  end

  add_index "address_tables", ["user_id"], name: "index_address_tables_on_user_id", using: :btree

  create_table "emails_tables", force: true do |t|
    t.integer  "user_id"
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emails_tables", ["user_id"], name: "index_emails_tables_on_user_id", using: :btree

  create_table "phone_numbers_tables", force: true do |t|
    t.integer  "user_id"
    t.integer  "country_code"
    t.integer  "phone_number"
    t.string   "label",        limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phone_numbers_tables", ["user_id"], name: "index_phone_numbers_tables_on_user_id", using: :btree

  create_table "users_tables", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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

ActiveRecord::Schema.define(version: 20160324172054) do

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state",      limit: 2
    t.integer  "zip_code"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "email_addresses", force: true do |t|
    t.string   "email_address", limit: 200
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "email_addresses", ["user_id"], name: "index_email_addresses_on_user_id", using: :btree

  create_table "phone_numbers", force: true do |t|
    t.integer  "area_code"
    t.integer  "phone_number"
    t.string   "label",        limit: 6, default: "none"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phone_numbers", ["user_id"], name: "index_phone_numbers_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

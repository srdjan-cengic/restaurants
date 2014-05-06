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

ActiveRecord::Schema.define(version: 20140505171750) do

  create_table "coupones", force: true do |t|
    t.string   "description"
    t.integer  "number_of_available"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "available_from"
    t.datetime "ends_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.string   "telephone"
    t.string   "fb_url"
    t.string   "image"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_code"
    t.boolean  "confirmed",         default: false
    t.datetime "last_login"
    t.string   "name"
    t.string   "username"
    t.integer  "role_id"
  end

end

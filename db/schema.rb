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

ActiveRecord::Schema.define(version: 20140918173028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.text     "street_line1"
    t.text     "street_line2"
    t.text     "city"
    t.text     "state"
    t.text     "zip"
    t.integer  "shelter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["shelter_id"], name: "index_addresses_on_shelter_id", using: :btree

  create_table "dog_matches", force: true do |t|
    t.integer  "dog_id"
    t.integer  "user_id"
    t.boolean  "is_favorite"
    t.boolean  "is_top"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "fortune"
  end

  add_index "dog_matches", ["dog_id"], name: "index_dog_matches_on_dog_id", using: :btree
  add_index "dog_matches", ["user_id"], name: "index_dog_matches_on_user_id", using: :btree

  create_table "dogs", force: true do |t|
    t.text     "petfinder_id", null: false
    t.text     "name"
    t.text     "image"
    t.text     "size"
    t.text     "gender"
    t.text     "age"
    t.text     "description"
    t.text     "url",          null: false
    t.integer  "shelter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "last_zip",     null: false
    t.boolean  "is_viewed"
    t.integer  "view_count"
    t.boolean  "is_available"
  end

  add_index "dogs", ["shelter_id"], name: "index_dogs_on_shelter_id", using: :btree

  create_table "shelters", force: true do |t|
    t.text     "petfinder_id", null: false
    t.text     "name"
    t.text     "phone"
    t.text     "email"
    t.text     "url",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                            null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end

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

ActiveRecord::Schema.define(version: 20140707221858) do

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

end

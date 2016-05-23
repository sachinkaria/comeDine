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

ActiveRecord::Schema.define(version: 20160523132150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cuisines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.text     "menu"
    t.date     "date"
    t.time     "time"
    t.integer  "places"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cuisine_id"
    t.integer  "table_id"
  end

  add_index "meals", ["cuisine_id"], name: "index_meals_on_cuisine_id", using: :btree
  add_index "meals", ["table_id"], name: "index_meals_on_table_id", using: :btree

  create_table "tables", force: :cascade do |t|
    t.string   "name"
    t.integer  "spaces"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "house_number"
    t.string   "street"
    t.string   "city"
    t.string   "postcode"
  end

  add_foreign_key "meals", "tables"
end

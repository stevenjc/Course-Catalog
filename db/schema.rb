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

ActiveRecord::Schema.define(version: 20160316011405) do

  create_table "courses", force: :cascade do |t|
    t.text     "comment"
    t.string   "term"
    t.string   "code"
    t.string   "continuity_id"
    t.string   "name"
    t.text     "description"
    t.float    "credits"
    t.boolean  "independent_study"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string   "email"
    t.string   "first"
    t.string   "middle"
    t.string   "last"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.text     "comment"
    t.string   "term"
    t.string   "name"
    t.string   "abbreviation"
    t.string   "segments"
    t.string   "subject_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end

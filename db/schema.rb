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

ActiveRecord::Schema.define(version: 20140411211739) do

  create_table "plants", force: true do |t|
    t.string   "name"
    t.integer  "iq",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", force: true do |t|
    t.string   "status"
    t.integer  "zombie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweets", ["zombie_id"], name: "index_tweets_on_zombie_id"

  create_table "weapons", force: true do |t|
    t.string   "name"
    t.integer  "strength"
    t.integer  "zombie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weapons", ["zombie_id"], name: "index_weapons_on_zombie_id"

  create_table "zombies", force: true do |t|
    t.string   "name"
    t.integer  "iq",         default: 0
    t.boolean  "vegetarian", default: false
    t.boolean  "hungry",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

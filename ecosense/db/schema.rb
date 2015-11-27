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

ActiveRecord::Schema.define(version: 20151127141633) do

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.string   "name",                limit: 255
    t.string   "company_number",      limit: 255
    t.string   "address",             limit: 255
    t.text     "about",               limit: 65535
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.boolean  "approved",                          default: false
  end

  create_table "companies_categories", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.integer  "company_id",  limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "post_id", limit: 4
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "company_id",       limit: 4
    t.string   "teaser",           limit: 255
    t.string   "title",            limit: 255
    t.text     "content",          limit: 65535
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.float    "latitude",         limit: 53
    t.float    "longitude",        limit: 53
    t.boolean  "ecological_issue",               default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "email",               limit: 255
    t.string   "password_digest",     limit: 255
    t.string   "mobile_number",       limit: 255
    t.text     "about",               limit: 65535
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.boolean  "admin",                             default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end

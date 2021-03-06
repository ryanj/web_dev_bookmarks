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

ActiveRecord::Schema.define(version: 20140103050903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: true do |t|
    t.string   "title",        limit: 150,                  null: false
    t.string   "domain",       limit: 75,                   null: false
    t.string   "path",                     default: "/",    null: false
    t.string   "query_string"
    t.integer  "port",                     default: 80,     null: false
    t.string   "protocol",     limit: 10,  default: "http", null: false
    t.text     "description"
    t.integer  "user_id",                                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "category_id"
  end

  add_index "bookmarks", ["created_at"], name: "index_bookmarks_on_created_at", using: :btree
  add_index "bookmarks", ["domain", "path", "query_string"], name: "index_bookmarks_on_domain_and_path_and_query_string", unique: true, using: :btree
  add_index "bookmarks", ["slug"], name: "index_bookmarks_on_slug", unique: true, using: :btree
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string  "name",      limit: 100, null: false
    t.integer "parent_id"
    t.string  "slug"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree
  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "token",      limit: 24, null: false
    t.integer  "user_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["token"], name: "index_sessions_on_token", unique: true, using: :btree
  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        limit: 50,                  null: false
    t.string   "email",           limit: 100,                 null: false
    t.string   "password_digest", limit: 60
    t.datetime "last_sign_in"
    t.boolean  "admin",                       default: false, null: false
    t.boolean  "blocked",                     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["created_at"], name: "index_users_on_created_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end

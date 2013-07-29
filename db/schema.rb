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

ActiveRecord::Schema.define(version: 20130729171255) do

  create_table "chyrpgroups", force: true do |t|
    t.string "name", limit: 100, default: ""
  end

  add_index "chyrpgroups", ["name"], name: "name", unique: true, using: :btree

  create_table "chyrppages", force: true do |t|
    t.string   "title",        limit: 250,        default: ""
    t.text     "body",         limit: 2147483647
    t.boolean  "show_in_list",                    default: true
    t.integer  "list_order",                      default: 0
    t.string   "clean",        limit: 128,        default: ""
    t.string   "url",          limit: 128,        default: ""
    t.integer  "user_id",                         default: 0
    t.integer  "parent_id",                       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chyrppermissions", id: false, force: true do |t|
    t.string  "id",       limit: 100, default: "", null: false
    t.string  "name",     limit: 100, default: ""
    t.integer "group_id",             default: 0,  null: false
  end

  create_table "chyrppost_attributes", id: false, force: true do |t|
    t.integer "post_id",                                 null: false
    t.string  "name",    limit: 100,        default: "", null: false
    t.text    "value",   limit: 2147483647
  end

  create_table "chyrpposts", force: true do |t|
    t.string   "feather",    limit: 32,  default: ""
    t.string   "clean",      limit: 128, default: ""
    t.string   "url",        limit: 128, default: ""
    t.boolean  "pinned",                 default: false
    t.string   "status",     limit: 32,  default: "public"
    t.integer  "user_id",                default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chyrpsessions", force: true do |t|
    t.text     "data",       limit: 2147483647
    t.integer  "user_id",                       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chyrpusers", force: true do |t|
    t.string   "login",     limit: 64,  default: ""
    t.string   "password",  limit: 32,  default: ""
    t.string   "full_name", limit: 250, default: ""
    t.string   "email",     limit: 128, default: ""
    t.string   "website",   limit: 128, default: ""
    t.integer  "group_id",              default: 0
    t.datetime "joined_at"
  end

  add_index "chyrpusers", ["login"], name: "login", unique: true, using: :btree

  create_table "gel2_comments", primary_key: "id_comment", force: true do |t|
    t.integer  "id_post",                  null: false
    t.string   "username",     limit: 50,  null: false
    t.string   "email",        limit: 100, null: false
    t.string   "web",          limit: 250
    t.text     "content",                  null: false
    t.string   "ip_user",      limit: 50,  null: false
    t.datetime "comment_date",             null: false
    t.integer  "spam",         limit: 1,   null: false
  end

  create_table "gel2_config", primary_key: "title", force: true do |t|
    t.integer "posts_limit",                  null: false
    t.text    "description",                  null: false
    t.string  "lang",             limit: 10,  null: false
    t.string  "template",         limit: 100, null: false
    t.string  "url_installation", limit: 250, null: false
  end

  create_table "gel2_data", primary_key: "id_post", force: true do |t|
    t.text     "title"
    t.string   "url",         limit: 250
    t.text     "description"
    t.integer  "type",        limit: 1,   default: 1, null: false
    t.datetime "date",                                null: false
    t.integer  "id_user",                             null: false
  end

  create_table "gel2_feeds", primary_key: "id_feed", force: true do |t|
    t.string   "url",                                  null: false
    t.string   "title",                                null: false
    t.integer  "type",       limit: 1, default: 1,     null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "error",                default: false, null: false
    t.integer  "credits",              default: 0,     null: false
    t.string   "site_url",                             null: false
    t.integer  "id_user",                              null: false
  end

  create_table "gel2_users", primary_key: "id_user", force: true do |t|
    t.string "name",     limit: 100
    t.string "login",    limit: 100, default: "", null: false
    t.string "password", limit: 64,  default: "", null: false
    t.string "email",    limit: 100
    t.string "website",  limit: 150
    t.text   "about"
  end

  create_table "gel_comments", primary_key: "id_comment", force: true do |t|
    t.integer  "id_post",                  null: false
    t.string   "username",     limit: 50,  null: false
    t.string   "email",        limit: 100, null: false
    t.string   "web",          limit: 250
    t.text     "content",                  null: false
    t.string   "ip_user",      limit: 50,  null: false
    t.datetime "comment_date",             null: false
    t.integer  "spam",         limit: 1,   null: false
  end

  create_table "gel_config", primary_key: "title", force: true do |t|
    t.integer "posts_limit",                  null: false
    t.text    "description",                  null: false
    t.string  "lang",             limit: 10,  null: false
    t.string  "template",         limit: 100, null: false
    t.string  "url_installation", limit: 250, null: false
  end

  create_table "gel_feeds", primary_key: "id_feed", force: true do |t|
    t.string   "url",                                  null: false
    t.string   "title",                                null: false
    t.integer  "type",       limit: 1, default: 1,     null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "error",                default: false, null: false
    t.integer  "credits",              default: 0,     null: false
    t.string   "site_url",                             null: false
    t.integer  "id_user",                              null: false
  end

  create_table "gel_options", primary_key: "name", force: true do |t|
    t.string "val", null: false
  end

  create_table "gel_users", primary_key: "id_user", force: true do |t|
    t.string "name",     limit: 100
    t.string "login",    limit: 100, default: "", null: false
    t.string "password", limit: 64,  default: "", null: false
    t.string "email",    limit: 100
    t.string "website",  limit: 150
    t.text   "about"
  end

  create_table "posts", force: true do |t|
    t.text     "title"
    t.string   "url",         limit: 250
    t.text     "description"
    t.integer  "the_type",                default: 1, null: false
    t.datetime "created_at"
    t.integer  "user_id",                 default: 1, null: false
    t.datetime "updated_at"
    t.string   "localfile"
    t.string   "localimage"
    t.string   "slug"
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

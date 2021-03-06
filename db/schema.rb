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

ActiveRecord::Schema.define(version: 20140826185856) do

  create_table "articles", force: true do |t|
    t.integer  "topic_id"
    t.text     "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", force: true do |t|
    t.text     "url"
    t.text     "description"
    t.text     "name"
    t.integer  "article_id"
    t.integer  "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "extension"
    t.string   "source"
    t.text     "preview_image_url"
  end

  create_table "downloads", force: true do |t|
    t.integer  "member_id"
    t.integer  "content_id"
    t.integer  "download_times", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grade_categories", force: true do |t|
    t.integer  "grade_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", force: true do |t|
    t.integer  "level"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "zone"
    t.string   "school_dependence"
    t.string   "interest_area"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               default: false
    t.string   "name"
    t.string   "lastname"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "members", ["confirmation_token"], name: "index_members_on_confirmation_token", unique: true
  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "notices", force: true do |t|
    t.text     "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "image_url"
    t.text     "link_url"
  end

  create_table "slides", force: true do |t|
    t.text     "image_url"
    t.text     "link_url"
    t.integer  "play_order", default: -1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.text     "title"
    t.integer  "grade_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

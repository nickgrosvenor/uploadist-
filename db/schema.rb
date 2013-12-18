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

ActiveRecord::Schema.define(version: 20131218035705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_photos", force: true do |t|
    t.integer  "photo_id"
    t.integer  "album_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "album_photos", ["album_id"], name: "index_album_photos_on_album_id", using: :btree
  add_index "album_photos", ["photo_id"], name: "index_album_photos_on_photo_id", using: :btree
  add_index "album_photos", ["user_id"], name: "index_album_photos_on_user_id", using: :btree

  create_table "albums", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "direct_upload_url"
    t.string   "upload_file_name"
    t.string   "upload_file_size"
    t.string   "upload_content_type"
    t.string   "upload_updated_at"
  end

  add_index "albums", ["user_id"], name: "index_albums_on_user_id", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "photos", force: true do |t|
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "direct_upload_url"
    t.integer  "rating_amount"
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_good"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "tagline"
    t.string   "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

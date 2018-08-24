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

ActiveRecord::Schema.define(version: 2018_08_24_000425) do

  create_table "comments", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.string "message"
    t.datetime "created_at"
  end

  create_table "follows", force: :cascade do |t|
    t.string "follower_id"
    t.string "followed_id"
  end

  create_table "pms", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.string "message"
    t.datetime "created_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string "user_id"
    t.string "title"
    t.string "body"
    t.string "image_url"
    t.integer "likes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "avatar_url"
    t.string "first_name"
    t.string "last_name"
    t.string "birthday"
    t.string "email"
    t.string "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end

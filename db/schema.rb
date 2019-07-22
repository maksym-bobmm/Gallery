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

ActiveRecord::Schema.define(version: 2019_07_22_123638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "type", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "username", null: false
    t.string "password", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.string "name", null: false
  end

  create_table "category_subscriptions", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "categories_id"
    t.index ["categories_id"], name: "index_category_subscriptions_on_categories_id"
    t.index ["user_id"], name: "index_category_subscriptions_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "body", null: false
    t.bigint "user_id", null: false
    t.bigint "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_comments_on_image_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "path", null: false
    t.datetime "created_at", null: false
    t.bigint "categories_id"
    t.index ["categories_id"], name: "index_images_on_categories_id"
  end

  create_table "likes", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "image_id", null: false
    t.index ["image_id"], name: "index_likes_on_image_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ulr", null: false
    t.datetime "created_at", null: false
    t.bigint "actions_id"
    t.index ["actions_id"], name: "index_logs_on_actions_id"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "provider"
    t.string "uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "users", column: "owner_id"
  add_foreign_key "category_subscriptions", "categories", column: "categories_id"
  add_foreign_key "category_subscriptions", "users"
  add_foreign_key "comments", "images"
  add_foreign_key "comments", "users"
  add_foreign_key "images", "categories", column: "categories_id"
  add_foreign_key "likes", "images"
  add_foreign_key "likes", "users"
  add_foreign_key "logs", "actions", column: "actions_id"
  add_foreign_key "logs", "users"
end

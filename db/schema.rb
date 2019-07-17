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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_07_12_075408) do
=======
ActiveRecord::Schema.define(version: 2019_07_16_071251) do
>>>>>>> auth

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.integer "integ"
    t.bigint "biginteg"
    t.decimal "numer"
    t.decimal "decim"
  end

=======
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
    t.string "password", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categories", "users", column: "owner_id"
  add_foreign_key "category_subscriptions", "categories", column: "categories_id"
  add_foreign_key "category_subscriptions", "users"
  add_foreign_key "comments", "images"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "images"
  add_foreign_key "likes", "users"
  add_foreign_key "logs", "actions", column: "actions_id"
  add_foreign_key "logs", "users"
>>>>>>> auth
end

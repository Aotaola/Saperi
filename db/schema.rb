# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_20_014830) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collection_sources", force: :cascade do |t|
    t.bigint "source_id", null: false
    t.bigint "collection_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_collection_sources_on_collection_id"
    t.index ["source_id"], name: "index_collection_sources_on_source_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.binary "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forums", force: :cascade do |t|
    t.bigint "collection_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_forums_on_collection_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "description"
    t.string "link"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sources_on_user_id"
  end

  create_table "user_collections", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "collection_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_user_collections_on_collection_id"
    t.index ["user_id"], name: "index_user_collections_on_user_id"
  end

  create_table "user_forums", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "forum_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forum_id"], name: "index_user_forums_on_forum_id"
    t.index ["user_id"], name: "index_user_forums_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.binary "avatar"
    t.text "bio"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "collection_sources", "collections"
  add_foreign_key "collection_sources", "sources"
  add_foreign_key "forums", "collections"
  add_foreign_key "sources", "users"
  add_foreign_key "user_collections", "collections"
  add_foreign_key "user_collections", "users"
  add_foreign_key "user_forums", "forums"
  add_foreign_key "user_forums", "users"
end

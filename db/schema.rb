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

ActiveRecord::Schema.define(version: 20180210235515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_tags", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_tags_on_card_id"
    t.index ["tag_id"], name: "index_card_tags_on_tag_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "type"
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.boolean "private"
    t.boolean "censored"
    t.string "review_status"
    t.text "quote"
    t.text "url"
    t.string "source"
    t.string "author"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_cards_on_type"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "canonical_name"
    t.string "variant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", default: "Topic", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "card_tags", "cards"
  add_foreign_key "card_tags", "tags"
end

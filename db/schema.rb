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

ActiveRecord::Schema.define(version: 2018_04_13_115033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "choose_cards", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "poker_id"
    t.bigint "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_choose_cards_on_card_id"
    t.index ["member_id"], name: "index_choose_cards_on_member_id"
    t.index ["poker_id"], name: "index_choose_cards_on_poker_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "email"
    t.boolean "master", default: false
    t.bigint "poker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poker_id"], name: "index_members_on_poker_id"
  end

  create_table "pokers", force: :cascade do |t|
    t.integer "pin_code"
    t.boolean "locked", default: false
    t.integer "suggested"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "choose_cards", "cards"
  add_foreign_key "choose_cards", "members"
  add_foreign_key "choose_cards", "pokers"
  add_foreign_key "members", "pokers"
end

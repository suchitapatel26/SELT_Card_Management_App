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

ActiveRecord::Schema.define(version: 2020_11_21_033613) do

  create_table "cards", force: :cascade do |t|
    t.string "card_value"
    t.string "card_suit"
    t.integer "pile_id"
    t.boolean "visible"
  end

  create_table "scores", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "score"
  end

  create_table "settings", force: :cascade do |t|
    t.integer "session_id"
    t.string "uid"
    t.integer "num_decks"
    t.integer "num_players"
    t.string "deck_settings"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.integer "account_id"
    t.string "email"
    t.string "encrypted_password"
    t.string "session_token"
    t.string "role"
    t.integer "active_session"
  end

end

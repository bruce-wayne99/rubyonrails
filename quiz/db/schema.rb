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

ActiveRecord::Schema.define(version: 20170916183646) do

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.integer "no_of_questions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaderboards", force: :cascade do |t|
    t.integer "score"
    t.integer "user_id"
    t.integer "genre_id"
    t.integer "subgenre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_leaderboards_on_genre_id"
    t.index ["subgenre_id"], name: "index_leaderboards_on_subgenre_id"
    t.index ["user_id"], name: "index_leaderboards_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "qtype"
    t.text "qstring"
    t.string "optionA"
    t.string "optionB"
    t.string "optionC"
    t.string "optionD"
    t.string "answer"
    t.integer "subgenre_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subgenre_id"], name: "index_questions_on_subgenre_id"
  end

  create_table "stats", force: :cascade do |t|
    t.integer "qnumber"
    t.integer "user_id"
    t.integer "subgenre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subgenre_id"], name: "index_stats_on_subgenre_id"
    t.index ["user_id"], name: "index_stats_on_user_id"
  end

  create_table "subgenres", force: :cascade do |t|
    t.string "name"
    t.integer "no_of_questions"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_subgenres_on_genre_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

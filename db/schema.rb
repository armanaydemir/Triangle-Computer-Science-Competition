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

ActiveRecord::Schema.define(version: 20150210163418) do

  create_table "badges", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "problems", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "contributor"
    t.string   "category"
    t.integer  "difficulty"
    t.string   "answer"
    t.integer  "round_id"
    t.integer  "num_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "contributor"
    t.integer  "difficulty"
    t.integer  "num_points"
    t.string   "category"
    t.string   "answer"
    t.integer  "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["round_id"], name: "index_questions_on_round_id"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "rounds", force: true do |t|
    t.integer  "number"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_members", force: true do |t|
    t.boolean  "leader"
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_members", ["team_id"], name: "index_team_members_on_team_id"
  add_index "team_members", ["user_id"], name: "index_team_members_on_user_id"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "points"
    t.string   "school"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams_badges", force: true do |t|
    t.integer  "team_id"
    t.integer  "badge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams_badges", ["badge_id"], name: "index_teams_badges_on_badge_id"
  add_index "teams_badges", ["team_id"], name: "index_teams_badges_on_team_id"

  create_table "teams_questions", force: true do |t|
    t.integer  "team_id"
    t.integer  "question_id"
    t.integer  "attempts"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams_questions", ["question_id"], name: "index_teams_questions_on_question_id"
  add_index "teams_questions", ["team_id"], name: "index_teams_questions_on_team_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "user_name"
    t.integer  "age"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

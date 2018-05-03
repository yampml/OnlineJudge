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

ActiveRecord::Schema.define(version: 20180503104438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "vote_up"
    t.integer "vote_down"
    t.index ["user_id", "created_at"], name: "index_blogs_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "contests", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.integer "duration"
    t.integer "is_running"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contests_users", id: false, force: :cascade do |t|
    t.bigint "contest_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "problems", force: :cascade do |t|
    t.string "name"
    t.float "timelimit"
    t.integer "memlimit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "file_name"
    t.string "problem_type"
    t.integer "contest_id"
    t.integer "is_show"
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "user_id"
    t.binary "source_code"
    t.datetime "time_at_submit"
    t.json "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "problem_id"
    t.string "solution_name"
    t.integer "contest_id"
    t.index ["problem_id"], name: "index_submissions_on_problem_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "blogs", "users"
  add_foreign_key "submissions", "problems"
  add_foreign_key "submissions", "users"
end

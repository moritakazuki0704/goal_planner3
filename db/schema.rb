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

ActiveRecord::Schema.define(version: 2023_09_26_140917) do

  create_table "ideals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "ideal_status"
    t.text "text_1"
    t.text "text_2"
    t.text "text_3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "keyword_1"
    t.string "keyword_2"
    t.string "keyword_3"
    t.string "keyword_4"
    t.string "keyword_5"
    t.string "keyword_6"
    t.string "keyword_7"
    t.string "keyword_8"
    t.string "keyword_9"
    t.string "keyword_10"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "missions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "mission_statement"
    t.text "mission_detail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "motivations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "motivation_status"
    t.text "motivation_1"
    t.text "motivation_2"
    t.text "motivation_3"
    t.text "motivation_4"
    t.text "motivation_5"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plans", force: :cascade do |t|
    t.integer "schedule_id", null: false
    t.string "task"
    t.integer "priority_status", default: 0
    t.integer "progress_status", default: 0
    t.boolean "availability", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "schedule_status", default: 1
    t.string "title"
    t.text "body"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "secret_word", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "planner_name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["secret_word"], name: "index_users_on_secret_word", unique: true
  end

  create_table "values", force: :cascade do |t|
    t.integer "motivation_id", null: false
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

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

ActiveRecord::Schema.define(version: 2023_09_26_140908) do

  create_table "ideals", force: :cascade do |t|
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
    t.text "personality_1"
    t.text "personality_2"
    t.text "personality_3"
    t.text "hair_make"
    t.text "body_make"
    t.text "fashion_make"
    t.text "lifestyle_1"
    t.text "lifestyle_2"
    t.text "lifestyle_3"
    t.text "time_1"
    t.text "time_2"
    t.text "time_3"
    t.text "working_1"
    t.text "working_2"
    t.text "working_3"
    t.text "residence_1"
    t.text "residence_2"
    t.text "residence_3"
    t.text "relationship_1"
    t.text "relationship_2"
    t.text "relationship_3"
    t.text "partner_1"
    t.text "partner_2"
    t.text "partner_3"
    t.text "partner_model"
    t.text "family_model"
    t.text "friend_model"
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
    t.text "positive_motivation_1"
    t.text "positive_motivation_2"
    t.text "positive_motivation_3"
    t.text "positive_motivation_4"
    t.text "positive_motivation_5"
    t.text "negative_motivation_1"
    t.text "negative_motivation_2"
    t.text "negative_motivation_3"
    t.text "negative_motivation_4"
    t.text "negative_motivation_5"
    t.text "to_do_motivation_1"
    t.text "to_do_motivation_2"
    t.text "to_do_motivation_3"
    t.text "to_do_motivation_4"
    t.text "to_do_motivation_5"
    t.text "want_motivation_1"
    t.text "want_motivation_2"
    t.text "want_motivation_3"
    t.text "want_motivation_4"
    t.text "want_motivation_5"
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

end

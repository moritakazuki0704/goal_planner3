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

ActiveRecord::Schema.define(version: 2024_01_23_220152) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "commits", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "commitment"
    t.text "purpose"
    t.integer "progress_stetas", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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
    t.integer "commit_id", null: false
    t.string "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "motivations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "emotion_stetas", default: 0
    t.text "appetite"
    t.text "memory"
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
    t.integer "commit_id", null: false
    t.string "title"
    t.text "body"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scrap_books", force: :cascade do |t|
    t.integer "user_id"
    t.text "comment"
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
    t.string "mission_statement"
    t.text "mission_detail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["secret_word"], name: "index_users_on_secret_word", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end

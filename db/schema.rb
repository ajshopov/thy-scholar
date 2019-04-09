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

ActiveRecord::Schema.define(version: 2019_04_09_225004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "response"
    t.bigint "user_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id", unique: true
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "charges", force: :cascade do |t|
    t.bigint "question_id"
    t.boolean "paid", default: false
    t.decimal "total"
    t.decimal "fee_charged"
    t.string "stripe_charge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_charges_on_question_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["user_id"], name: "index_lectures_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "query"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.decimal "price"
    t.string "state"
    t.index ["recipient_id"], name: "index_questions_on_recipient_id"
    t.index ["sender_id"], name: "index_questions_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.string "stripe_id"
    t.string "stripe_access_key"
    t.string "stripe_publishable_key"
    t.string "stripe_refresh_token"
    t.string "stripe_customer_id"
    t.json "profile_pic"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "charges", "questions"
  add_foreign_key "lectures", "users"
  add_foreign_key "questions", "users", column: "recipient_id"
  add_foreign_key "questions", "users", column: "sender_id"
end

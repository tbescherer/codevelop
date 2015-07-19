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

ActiveRecord::Schema.define(version: 20150719010403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_choices", force: :cascade do |t|
    t.integer  "question_id", null: false
    t.string   "body",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answer_choices", ["question_id"], name: "index_answer_choices_on_question_id", using: :btree

  create_table "conversation_replies", force: :cascade do |t|
    t.integer  "conv_id",    null: false
    t.integer  "user_id",    null: false
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversation_replies", ["conv_id"], name: "index_conversation_replies_on_conv_id", using: :btree
  add_index "conversation_replies", ["user_id"], name: "index_conversation_replies_on_user_id", using: :btree

  create_table "conversations", force: :cascade do |t|
    t.integer  "user_one_id", null: false
    t.integer  "user_two_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["user_one_id"], name: "index_conversations_on_user_one_id", using: :btree
  add_index "conversations", ["user_two_id"], name: "index_conversations_on_user_two_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "body",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_answers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "answer_choice_id"
    t.integer  "weight"
    t.text     "explanation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_answers", ["answer_choice_id"], name: "index_user_answers_on_answer_choice_id", using: :btree
  add_index "user_answers", ["user_id"], name: "index_user_answers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",                           null: false
    t.string   "email",                              null: false
    t.string   "password_digest",                    null: false
    t.string   "session_token",                      null: false
    t.string   "language",          default: "none"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "about_field_one"
    t.text     "about_field_two"
    t.text     "about_field_three"
    t.integer  "age"
    t.string   "job"
    t.text     "looking_for"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end

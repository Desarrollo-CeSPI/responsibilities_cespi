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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130204164450) do

  create_table "answer_values", :force => true do |t|
    t.integer  "value"
    t.integer  "questionnaire_id"
    t.integer  "answer_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "answer_values", ["answer_id"], :name => "index_answer_values_on_answer_id"
  add_index "answer_values", ["questionnaire_id"], :name => "index_answer_values_on_questionnaire_id"

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.string   "name"
    t.integer  "percentage"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "min_value"
    t.integer  "max_value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questionnaire_questions", :force => true do |t|
    t.integer  "weight"
    t.integer  "question_id"
    t.integer  "questionnaire_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "questionnaire_questions", ["question_id"], :name => "index_questionnaire_questions_on_question_id"
  add_index "questionnaire_questions", ["questionnaire_id"], :name => "index_questionnaire_questions_on_questionnaire_id"

  create_table "questionnaires", :force => true do |t|
    t.string   "name"
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "closed"
  end

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.string   "question_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "user_questionnaires", :force => true do |t|
    t.integer  "user_id"
    t.integer  "questionnaire_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "scoring"
  end

  add_index "user_questionnaires", ["user_id", "questionnaire_id"], :name => "index_user_questionnaires_on_user_id_and_questionnaire_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_admin",               :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["user_name"], :name => "index_users_on_user_name", :unique => true

end

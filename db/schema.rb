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

ActiveRecord::Schema.define(:version => 20121217175803) do

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
  end

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.string   "question_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end

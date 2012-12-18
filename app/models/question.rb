class Question < ActiveRecord::Base
  attr_accessible :name, :question_type

  has_many :questionnaire_questions
  has_many :questionnaire , through: :questionnaire_questions

end

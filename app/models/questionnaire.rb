class Questionnaire < ActiveRecord::Base
  attr_accessible :date_from, :date_to, :name, :questionnaire_question_ids, :question_ids

  has_many :questionnaire_questions
  has_many :questions , through: :questionnaire_questions

  validates :date_from, :date_to, :name, presence: true

end

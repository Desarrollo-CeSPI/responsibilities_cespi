class Questionnaire < ActiveRecord::Base
  # accessors
  attr_accessible :date_from, :date_to, :name, :questionnaire_question_ids, :question_ids, :question_tokens
  attr_reader :question_tokens

  # associations
  has_many :questionnaire_questions
  has_many :questions , through: :questionnaire_questions

  # nested attributes 
  accepts_nested_attributes_for :questionnaire_questions

  # validates
  validates :date_from, :date_to, :name, presence: true


  def question_tokens=(ids)
    self.question_ids = ids.split(",")
  end  

end

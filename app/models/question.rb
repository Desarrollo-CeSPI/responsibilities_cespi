class Question < ActiveRecord::Base
  # accessors
  attr_accessible :name, :question_type, :answers, :answers_attributes, :question_tokens
  
  attr_reader :question_tokens

  # associations
  has_many :questionnaire_questions
  has_many :questionnaire , through: :questionnaire_questions
  has_many :answers

  # nested attributes
  accepts_nested_attributes_for :answers

  # validates
  validates :name, :question_type, presence: true
  validate :check_has_answer

  # methods
  
  def question_tokens=(ids)
    self.question_ids = ids.split(",")
  end  



  private

    def check_has_answer
      errors[:base] << "Debe crear por lo menos una respuesta" unless answers.any?
    end

end

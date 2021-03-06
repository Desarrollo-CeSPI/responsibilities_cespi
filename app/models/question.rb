class Question < ActiveRecord::Base
  # accessors
  attr_accessible :name, :question_type, :answers, :answers_attributes, :question_tokens, :name_and_type
  
  attr_reader :question_tokens

  # associations
  has_many :questionnaire_questions
  has_many :questionnaire , through: :questionnaire_questions
  
  has_many :answers, dependent: :destroy # borrado en cascada por software


  # nested attributes 
  # reject_if no guarda una answer vacía (ni la valida)
  # allow_destroy permite eliminarla
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: :true

  # validates -> from RoR; validate -> own validations
  validates :name, :question_type, presence: :true
  validate :check_has_answer

  # methods
  
  def question_tokens=(ids)
    self.question_ids = ids.split(",")
  end  

  def name_and_type
    "#{self.name} (#{self.question_type})"
  end

  private

  def check_has_answer
    errors.add :base, :at_least_one unless answers.any?
  end

end

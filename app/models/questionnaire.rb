class Questionnaire < ActiveRecord::Base
  # accessors
  before_save :check_date_to

  attr_accessible :date_from, :date_to, :name, :questionnaire_question_ids, :question_ids, :question_tokens, :closed
  attr_reader :question_tokens

  # associations
  has_many :questionnaire_questions
  has_many :questions, through: :questionnaire_questions

  # nested attributes 
  accepts_nested_attributes_for :questionnaire_questions
  accepts_nested_attributes_for :questions

  # validates
  validates :date_from, :date_to, :name, presence: true


  def question_tokens=(ids)
    self.question_ids = ids.split(",")
  end  

  def questions_custom(param)
    self.questions.where("question_type = ?", param)
  end

  def check_date_to
    if (self.date_to >= Date.today)
      self.closed= false
    end
    true
  end

  def questions_propias
    questions_custom(:Propia)
  end

  def questions_anonimas
    questions_custom(:Anonima)
  end

  def questions_administrador
    questions_custom(:Administrador)
  end

  def close
    self.closed= true
    save
  end

  def closed?
    closed
  end

  def dated?
    Date.today > date_to
  end

  def total_score_admin

    array_questions_ids = Array.new

    self.questions_propias.each do |q|
        array_questions_ids.push(q.id)
    end

    self.questionnaire_questions.select{|q| array_questions_ids.include?(q.question_id)}.map{|question| question.weight}.sum
  end

  def question_weight(question_id)
    questionnaire_questions.find_by_question_id(question_id).weight
  end
end

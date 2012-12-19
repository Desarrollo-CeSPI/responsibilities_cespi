class QuestionnaireQuestion < ActiveRecord::Base
  before_save :default_values

  belongs_to :question
  belongs_to :questionnaire


  attr_accessible :weight, :question, :questionnaire

  def default_values
    self.weight ||= 10
  end  

end

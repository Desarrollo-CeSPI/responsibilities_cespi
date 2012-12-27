class AnswerValue < ActiveRecord::Base
  #accessors
  attr_accessible :value

  #associations
  belongs_to :questionnaire
  belongs_to :answer
end

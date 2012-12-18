class AnswerValue < ActiveRecord::Base
  belongs_to :questionnaire
  belongs_to :answer
  attr_accessible :value
end

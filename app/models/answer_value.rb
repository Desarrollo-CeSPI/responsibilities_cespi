class AnswerValue < ActiveRecord::Base
  belongs_to :questionnaire
  belongs_to :answer
  belongs_to :from, class_name: 'User'
  belongs_to :who, class_name: 'User'
  attr_accessible :value, :user, :questionnaire, :from, :who
end

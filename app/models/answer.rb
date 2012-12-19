class Answer < ActiveRecord::Base
  # accessors
  attr_accessible :name, :percentage, :question_id

  # associations
  belongs_to :question

  # validates
  validates :percentage, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 100 }
  validates :name, presence: true


end
 
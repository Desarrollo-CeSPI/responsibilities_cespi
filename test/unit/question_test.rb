require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  
  test "present attributes" do
    question = Question.new

    assert question.invalid?
    assert_equal 3, question.errors.size
    assert_present question.errors[:name]
    assert_present question.errors[:question_type]
    assert_present question.errors[:answer]
  end
end

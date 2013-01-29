require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  
  test "required attributes should be present" do
    question = Question.new

    assert question.invalid?
    assert_equal 3, question.errors.size
    assert_present question.errors[:name]
    assert_present question.errors[:question_type]
    assert_present question.errors[:answer]
    refute question.save
  end

  test "should have at least one answer" do 
    question           = questions(:question_one)
    question.answers = []

    refute question.valid?
    assert_present question.errors[:answer]
    refute question.save
  end

end

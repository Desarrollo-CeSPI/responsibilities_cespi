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

  test "question should have at least one question" do 
    question                = Question.new
    question.name           = questions(:question_one).name
    question.question_type  = questions(:question_one).question_type

    answer                  = Answer.new
    answer.name             = "pepe"
    answer.question         = question
    answer.save

    # raise question.errors.to_yaml
    question.save

    assert question.valid?
    assert_equal 1, question.answers.size
  end

end

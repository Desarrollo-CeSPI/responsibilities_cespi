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
    question                = Question.new
    question.name           = questions(:question_one).name
    question.question_type  = questions(:question_one).question_type

    answer                  = Answer.new
    answer.name             = "Un nombre"
    answer.question         = question
    answer.save

    # raise question.errors.to_yaml

    assert question.save
    assert question.valid?
    assert_equal 1, question.answers.size
  end

end

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  test "should not create question when all fields are nil" do
    question = Question.new

    assert question.invalid?
    assert_equal 3, question.errors.size
    assert_present question.errors[:name]
    assert_present question.errors[:question_type]
    assert_present question.errors[:base]
    refute question.save, "Tried to save question being all fields nil"
  end

  test "should not create question when name is nil" do
    question = questions(:question_one)
    field_not_nil_test(:name=, question)
  end

  test "should not create question when question_type is nil" do
    question = questions(:question_one)
    field_not_nil_test(:question_type=, question)
  end

  test "question should have at least one answer" do
    question = questions(:question_one)
    question.answers = []

    refute question.valid?
    assert_present question.errors[:base]
    refute question.save
  end

  private
  def field_not_nil_test(field, question)
    question.send field, nil
    refute question.save
  end

end

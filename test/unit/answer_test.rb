require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  
  test "should not create answer when all fields are nil" do
    answer = Answer.new

    assert answer.invalid?
    assert_equal 2, answer.errors.size
    assert_present answer.errors[:name]
    assert_present answer.errors[:percentage]
    refute answer.save, "Tried to save answer being all fields nil"
  end

  test "should create answer when all required fields are filled" do 
    answer = get_new_answer
    assert answer.save
  end

  test "should not create answer when name is nil" do
    answer = get_new_answer
    field_not_nil_test(:name=, answer)
  end

  test "should not create answer when percentage is nil" do
    answer = get_new_answer
    field_not_nil_test(:percentage=, answer)
  end

  test "percentage should not be less than 0" do 
    answer = Answer.new
    answer.name = answers(:answer_one).name
    answer.question = answers(:answer_one).question
    answer.percentage = -1

    assert answer.invalid?
    assert_equal 1, answer.errors.size
    assert_present answer.errors[:percentage]
  end

  test "percentage should not be greater than 100" do 
    answer = Answer.new
    answer.name = answers(:answer_one).name
    answer.question = answers(:answer_one).question
    answer.percentage = 101

    assert answer.invalid?
    assert_equal 1, answer.errors.size
    assert_present answer.errors[:percentage]
  end

  test "percentage should be an integer" do 
    answer = Answer.new
    answer.name = answers(:answer_one).name
    answer.question = answers(:answer_one).question
    answer.percentage = "not an integer"

    answer.invalid?
    assert_equal 1, answer.errors.size
    assert_present answer.errors[:percentage]
  end

  private
  def get_new_answer
    answer = Answer.new
    answer.name = 'Muy bien'
    answer.question = answers(:answer_one).question
    answer.percentage = 21

    answer
  end

  def field_not_nil_test(field, answer)
    answer.send field, nil
    refute answer.save
  end
end

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  
  test "present attributes" do
    answer = Answer.new

    assert answer.invalid?
    assert_equal 2, answer.errors.size
    assert_present answer.errors[:name]
    assert_present answer.errors[:percentage]
  end

  test "percentage should not be less than 0" do 
    answer            = Answer.new
    answer.name       = answers(:answer_one).name
    answer.question   = answers(:answer_one).question
    answer.percentage = -1

    assert answer.invalid?
    assert_equal 1, answer.errors.size
    assert_present answer.errors[:percentage]
  end

  test "percentage should not be grater than 100" do 
    answer            = Answer.new
    answer.name       = answers(:answer_one).name
    answer.question   = answers(:answer_one).question
    answer.percentage = 101

    assert answer.invalid?
    assert_equal 1, answer.errors.size
    assert_present answer.errors[:percentage]
  end

  test "percentage should be an integer" do 
    answer            = Answer.new
    answer.name       = answers(:answer_one).name
    answer.question   = answers(:answer_one).question
    answer.percentage = "pepe"

    answer.invalid?
    assert_equal 1, answer.errors.size
    assert_present answer.errors[:percentage]
  end

end

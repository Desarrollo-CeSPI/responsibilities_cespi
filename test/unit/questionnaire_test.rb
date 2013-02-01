require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase
  
  test "should create questionnaire when all required fields are filled" do 
    questionnaire = get_new_questionnaire
    assert questionnaire.save
  end

  test "should not create questionnaire when all fields are nil" do
    questionnaire = Questionnaire.new
    assert questionnaire.invalid?
    assert_equal 3, questionnaire.errors.size
    assert_present questionnaire.errors[:name]
    assert_present questionnaire.errors[:date_to]
    assert_present questionnaire.errors[:date_from]
    refute questionnaire.save, "Tried to save questionnaire being all fields nil"
  end

  test "should not create questionnaire when name is nil" do
    questionnaire = get_new_questionnaire
    field_not_nil_test(:name=, questionnaire)
  end

  test "should not create questionnaire when date_from is nil" do
    questionnaire = get_new_questionnaire
    field_not_nil_test(:date_from=, questionnaire)
  end

  test "should not create questionnaire when date_to is nil" do
    questionnaire = get_new_questionnaire
    field_not_nil_test(:date_to=, questionnaire)
  end

  test "questionnaire should close" do
    questionnaire = questionnaires(:questionnaire_one)

    questionnaire.close
 
    assert questionnaire.dated?
    assert questionnaire.closed?
  end

  test "questionnaire should not close on future date_to" do
    questionnaire = questionnaires(:questionnaire_one)
    questionnaire.date_to = Date.today+2
    questionnaire.close
 
    refute questionnaire.closed?
  end

  private

  def get_new_questionnaire
    questionnaire = Questionnaire.new
    questionnaire.name = 'Junior'
    questionnaire.date_to = Date.today+6
    questionnaire.date_from = Date.today

    questionnaire
  end

  def field_not_nil_test(field, questionnaire)
    questionnaire.send field, nil
    refute questionnaire.save
  end

end

require 'test_helper'
include Devise::TestHelpers

class RestControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
  end


  test "should update answer percentage" do
  	
    @answer = Answer.all.first

    old_pertentage = @answer.percentage
    get :updateAnswerWeight, answer_id: @answer.id, value: 88

    assert_equal 88,assigns(:answer).percentage
    assert_not_equal old_pertentage, assigns(:answer).percentage

  end

  test "should update questionnaire_question weight" do

    @questionnaire = Questionnaire.all.first

    old_value = @questionnaire.questionnaire_questions.first.weight

    get :updateQuestionWeight,  questionnaire_id: @questionnaire.questionnaire_questions.first.questionnaire_id, 
                                question_id: @questionnaire.questionnaire_questions.first.question_id,
                                value: 99

    assert_equal 99,assigns(:questionnaire_question).first.weight
    assert_not_equal 8,assigns(:questionnaire_question).first.weight
  end

end

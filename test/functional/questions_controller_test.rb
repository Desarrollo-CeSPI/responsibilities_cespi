require 'test_helper'
include Devise::TestHelpers
class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:question_one)
    sign_in users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    skip 'debe tener una pregunta asociada si o si' 
    assert_difference('Question.count') do
      post :create, question: { name: @question.name, question_type: @question.question_type }
    end

    assert_redirected_to question_path(assigns(:question))
  end

  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    put :update, id: @question, question: { name: @question.name, question_type: @question.question_type }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end

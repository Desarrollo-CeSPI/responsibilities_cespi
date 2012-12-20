require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  setup do
    @answer = answers(:answer_one)
    sign_in users(:one)
  end

end

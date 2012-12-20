require 'test_helper'
include Devise::TestHelpers

# a answer se llega desde una question siempre. test en question

class AnswersControllerTest < ActionController::TestCase
  setup do
    @answer = answers(:answer_one)
    sign_in users(:one)
  end

end

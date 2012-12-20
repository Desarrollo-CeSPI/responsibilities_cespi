require 'test_helper'
include Devise::TestHelpers
class AnswersControllerTest < ActionController::TestCase
  setup do
    @answer = answers(:answer_one)
    sign_in users(:one)
  end

end

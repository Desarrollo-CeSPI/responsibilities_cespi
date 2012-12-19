require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase
  
  test "precent attributes" do 
    questionnaire = Questionnaire.new

    assert questionnaire.invalid?
    assert_equal 3, questionnaire.errors.size
    assert_present questionnaire.errors[:name]
    assert_present questionnaire.errors[:date_to]
    assert_present questionnaire.errors[:date_from]
  end

end

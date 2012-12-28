require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase
  
  test "present attributes" do 
    questionnaire = Questionnaire.new

    assert questionnaire.invalid?
    assert_equal 3, questionnaire.errors.size
    assert_present questionnaire.errors[:name]
    assert_present questionnaire.errors[:date_to]
    assert_present questionnaire.errors[:date_from]
  end

  test 'should close' do

    questionnaire = questionnaires(:questionnaire_one)

    questionnaire.close
 
    assert questionnaire.dated?
    assert questionnaire.closed?
  end

  test 'should not close on future date_to' do

    questionnaire = questionnaires(:questionnaire_one)

    questionnaire.date_to= Date.today +2
    
    questionnaire.close
 
    refute questionnaire.closed?
  end


end

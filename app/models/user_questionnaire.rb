class UserQuestionnaire < ActiveRecord::Base
  belongs_to :user
  belongs_to :questionnaire

  attr_accessible :scoring


  def calculate_scoring(questionnaire_id)
      UserQuestionnaire.find_all_by_questionnaire_id(questionnaire_id).each do |uq|
          uq.scoring= uq.user.calculate_scoring(questionnaire_id).round
          uq.save
      end
  end
end

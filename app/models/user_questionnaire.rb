class UserQuestionnaire < ActiveRecord::Base
  belongs_to :user
  belongs_to :questionnaire

  attr_accessible :scoring


  def self.calculate_scoring(questionnaire_id)
      UserQuestionnaire.find_all_by_questionnaire_id(questionnaire_id).each do |uq|
          uq.scoring= uq.user.calculate_scoring(questionnaire_id).round
          uq.save
      end
  end

  def get_category
    category = Category.where("min_value <= ? AND max_value >= ?",scoring,scoring).first

    if (!category.nil?)
      category.name
    end

  end
end

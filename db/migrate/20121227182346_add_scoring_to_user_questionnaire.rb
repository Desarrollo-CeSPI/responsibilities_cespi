class AddScoringToUserQuestionnaire < ActiveRecord::Migration
  def change
    add_column :user_questionnaires, :scoring, :integer
  end
end

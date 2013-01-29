class CreateUserQuestionnaires < ActiveRecord::Migration
  def change
    create_table :user_questionnaires do |t|
      t.references :user
      t.references :questionnaire

      t.timestamps
    end
    add_index :user_questionnaires, [:user_id, :questionnaire_id], unique: true   
  end
end

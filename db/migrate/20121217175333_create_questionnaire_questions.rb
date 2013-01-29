class CreateQuestionnaireQuestions < ActiveRecord::Migration
  def change
    create_table :questionnaire_questions do |t|
      t.integer :weight
      t.references :question
      t.references :questionnaire

      t.timestamps
    end
    add_index :questionnaire_questions, :question_id
    add_index :questionnaire_questions, :questionnaire_id
  end
end

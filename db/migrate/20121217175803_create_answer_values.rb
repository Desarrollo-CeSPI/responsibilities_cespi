class CreateAnswerValues < ActiveRecord::Migration
  def change
    create_table :answer_values do |t|
      t.integer :value
      t.references :questionnaire
      t.references :answer
      t.integer :from_id
      t.integer :who_id
      t.timestamps
    end
    add_index :answer_values, :questionnaire_id
    add_index :answer_values, :answer_id
  end
end

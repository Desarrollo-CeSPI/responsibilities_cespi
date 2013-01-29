class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :name
      t.date :date_from
      t.date :date_to

      t.timestamps
    end
  end
end

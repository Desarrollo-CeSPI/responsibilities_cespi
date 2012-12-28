class AddClosedToQuestionnaire < ActiveRecord::Migration
  def change
    add_column :questionnaires, :closed, :boolean
  end
end

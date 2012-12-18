class AddPercentageToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :percentage, :integer
  end
end

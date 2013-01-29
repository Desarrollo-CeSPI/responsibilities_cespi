class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :min_value
      t.integer :max_value

      t.timestamps
    end
  end
end

class AddEsPutitoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :es_putito, :boolean
  end
end

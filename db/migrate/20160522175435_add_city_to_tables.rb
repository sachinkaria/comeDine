class AddCityToTables < ActiveRecord::Migration
  def change
    add_column :tables, :city, :string
  end
end

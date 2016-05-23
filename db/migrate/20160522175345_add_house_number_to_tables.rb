class AddHouseNumberToTables < ActiveRecord::Migration
  def change
    add_column :tables, :house_number, :string
  end
end

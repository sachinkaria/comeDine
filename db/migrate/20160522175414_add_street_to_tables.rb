class AddStreetToTables < ActiveRecord::Migration
  def change
    add_column :tables, :street, :string
  end
end

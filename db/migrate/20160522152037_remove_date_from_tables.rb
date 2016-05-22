class RemoveDateFromTables < ActiveRecord::Migration
  def change
    remove_column :tables, :date, :date
  end
end

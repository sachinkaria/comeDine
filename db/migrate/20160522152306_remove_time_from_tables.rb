class RemoveTimeFromTables < ActiveRecord::Migration
  def change
    remove_column :tables, :time, :time
  end
end

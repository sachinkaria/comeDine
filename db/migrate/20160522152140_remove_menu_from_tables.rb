class RemoveMenuFromTables < ActiveRecord::Migration
  def change
    remove_column :tables, :menu, :text
  end
end

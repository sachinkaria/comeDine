class RemoveCuisineIndexFromTables < ActiveRecord::Migration
  def change
    remove_column :tables, :cuisine_id, :index
  end
end

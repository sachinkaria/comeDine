class RemoveCuisineIdFromMeals < ActiveRecord::Migration
  def change
    remove_column :meals, :cuisine_id, :integer
  end
end

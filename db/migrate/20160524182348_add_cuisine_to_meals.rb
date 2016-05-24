class AddCuisineToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :cuisine, :string
  end
end

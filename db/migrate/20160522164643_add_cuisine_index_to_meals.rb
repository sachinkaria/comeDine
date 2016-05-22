class AddCuisineIndexToMeals < ActiveRecord::Migration
  def change
    add_reference :meals, :cuisine, index: true
  end
end

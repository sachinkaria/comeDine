class AddTableIdToMeals < ActiveRecord::Migration
  def change
    add_reference :meals, :table, index: true, foreign_key: true
  end
end

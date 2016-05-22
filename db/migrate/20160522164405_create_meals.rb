class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.text :menu
      t.date :date
      t.time :time
      t.integer :places

      t.timestamps null: false
    end
  end
end

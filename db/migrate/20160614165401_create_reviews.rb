class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comments
      t.integer :rating_food
      t.integer :rating_hygiene
      t.integer :rating_atmosphere

      t.timestamps null: false
    end
  end
end

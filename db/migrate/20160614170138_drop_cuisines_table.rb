class DropCuisinesTable < ActiveRecord::Migration

  def change
    drop_table :cuisines do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end

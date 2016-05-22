class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.text :menu
      t.integer :seat
      t.date :date
      t.time :time

      t.timestamps null: false
    end
  end
end

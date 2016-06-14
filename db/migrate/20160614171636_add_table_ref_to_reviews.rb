class AddTableRefToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :table, index: true, foreign_key: true
  end
end

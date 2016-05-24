class AddPostcodeToTables < ActiveRecord::Migration
  def change
    add_column :tables, :postcode, :string
  end
end

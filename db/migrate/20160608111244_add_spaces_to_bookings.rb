class AddSpacesToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :spaces, :integer
  end
end

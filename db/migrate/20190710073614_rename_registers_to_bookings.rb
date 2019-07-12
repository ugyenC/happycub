class RenameRegistersToBookings < ActiveRecord::Migration[5.2]
  def change
    rename_table :registers, :bookings
  end
end

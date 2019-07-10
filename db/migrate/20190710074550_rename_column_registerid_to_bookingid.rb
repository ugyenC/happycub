class RenameColumnRegisteridToBookingid < ActiveRecord::Migration[5.2]
  def change
    rename_column :guests, :register_id, :booking_id
  end
end

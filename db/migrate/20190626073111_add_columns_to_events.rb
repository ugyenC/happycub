class AddColumnsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :guest_per_member, :integer
    add_column :events, :total_guests, :integer
  end
end

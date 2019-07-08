class DropRegistersTable < ActiveRecord::Migration[5.2]

  def up
    drop_table :registers
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

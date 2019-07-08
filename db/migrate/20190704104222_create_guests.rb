class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :fname
      t.string :lname
      t.integer :age
      t.references :register, foreign_key: true

      t.timestamps
    end
  end
end

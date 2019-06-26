class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :category_id
      t.date :start_date
      t.date :end_date
      t.string :location
      t.integer :capacity
      t.boolean :allow_guests

      t.timestamps
    end
  end
end

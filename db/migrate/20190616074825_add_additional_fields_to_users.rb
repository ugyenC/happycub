class AddAdditionalFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fname, :string 
    add_column :users, :lname, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :is_female, :boolean, default: false
  end
end

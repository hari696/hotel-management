class AddUniqueIndexToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_index :customers, :email, unique: true
    add_index :customers, :phone_number, unique: true
  end
end

class AddUniqueIndexToHotels < ActiveRecord::Migration[5.1]
  def change
    add_index :hotels, :contact_number, unique: true
  end
end

class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.string :description
      t.text :address, null: false
      t.string :contact_number, null: false
      t.string :hotel_pic
      t.text :amenities
      
      t.timestamps
    end
  end
end

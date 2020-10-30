class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.string :room_type, null: false
      t.string :description
      t.integer :max_adults, null: false
      t.integer :max_children, null: false
      t.float :price, null: false
      t.text :amenities
      t.references :hotel, foreign_key: true
      
      t.timestamps
    end
  end
end

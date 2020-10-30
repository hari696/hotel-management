class CreateBookedRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :booked_rooms do |t|
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :status, null: false
      t.datetime :check_in, null: false
      t.datetime :check_out, null: false
      t.references :room, foreign_key: true
      t.references :customer, foreign_key: true
      
      t.timestamps
    end
  end
end

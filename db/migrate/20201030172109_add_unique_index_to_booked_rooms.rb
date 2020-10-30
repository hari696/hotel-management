class AddUniqueIndexToBookedRooms < ActiveRecord::Migration[5.1]
  def change
    add_index :booked_rooms, [:start_date, :end_date, :room_id], unique: true
  end
end

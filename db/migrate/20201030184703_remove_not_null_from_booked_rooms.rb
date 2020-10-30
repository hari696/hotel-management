class RemoveNotNullFromBookedRooms < ActiveRecord::Migration[5.1]
  def change
    change_column :booked_rooms, :check_in, :datetime, null: true
    change_column :booked_rooms, :check_out, :datetime, null: true
  end
end

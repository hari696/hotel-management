module BookedRoomsHelper
  def get_rooms_options
    Room.all.collect { |room| [ room.name, room.id ] }
  end
  
  def get_customers_options
    Customer.all.collect { |customer| [ customer.name, customer.id ] }
  end
  
  def get_status_options
    BOOKED_ROOM_STATUS_ENUM.map { |status| [status.to_s.split('_').map(&:capitalize).join(' '), status] }
  end
end

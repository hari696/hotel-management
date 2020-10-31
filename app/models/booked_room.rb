class BookedRoom < ApplicationRecord
  default_scope { order(created_at: :desc) }
  
  belongs_to :room
  belongs_to :customer
  
  validates :start_date, :end_date, :status, presence: true
  validates :room_id, uniqueness: { scope: [:start_date, :end_date] }
  
  enum status: BOOKED_ROOM_STATUS_ENUM
  
  scope :get_booked_room_ids, -> () {
    BookedRoom.where(status: BOOKED_ROOM_STATUS_ENUM[0])
  }
end

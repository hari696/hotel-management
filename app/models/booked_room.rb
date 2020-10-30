class BookedRoom < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :room
  belongs_to :customer
  
  validates :start_date, :end_date, :status, presence: true
  validates :room_id, uniqueness: { scope: [:start_date, :end_date] }
  
  enum status: BOOKED_ROOM_STATUS_ENUM
end

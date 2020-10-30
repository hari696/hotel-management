class BookedRoom < ApplicationRecord
  belongs_to :room
  belongs_to :customer
  
  validates :start_date, :end_date, :status, :check_in, :check_out, presence: true
  validates :room_id, uniqueness: { scope: [:start_date, :end_date] }
end

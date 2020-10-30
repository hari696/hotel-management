class BookedRoom < ApplicationRecord
  belongs_to :room
  belongs_to :customer

  validates :start_date, :end_date, :status, :check_in, :check_out, presence: true
end

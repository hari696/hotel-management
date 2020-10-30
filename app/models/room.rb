class Room < ApplicationRecord
  belongs_to :hotel
  
  validates :name, :room_type, :max_adults,  :max_children, :price, :amenities, presence: true
  validates :max_adults, :max_children, numericality: { only_integer: true }
  validates :max_adults, :price, numericality: { greater_than_or_equal_to: 1 }
end

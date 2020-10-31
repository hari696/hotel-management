class Room < ApplicationRecord
  belongs_to :hotel

  has_many :booked_rooms, dependent: :destroy
  
  validates :name, :room_type, :max_adults,  :max_children, :price, :amenities, presence: true
  validates :max_adults, :max_children, numericality: { only_integer: true }
  validates :max_adults, :price, numericality: { greater_than_or_equal_to: 1 }

  scope :get_available_rooms, -> () {
    Room.where('id NOT IN (?)', BookedRoom.get_booked_room_ids.pluck(:room_id))
  }

  scope :search_rooms, -> (keyword) {
    get_available_rooms.where("lower(name) LIKE ?", "%#{keyword.downcase}%")
  }
end

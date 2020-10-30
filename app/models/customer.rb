class Customer < ApplicationRecord
  default_scope { order(:name) }

  has_many :booked_rooms, dependent: :destroy

  validates :name, :email, :phone_number, :address, presence: true
  validates :phone_number, length: { is: 10 }
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true
end

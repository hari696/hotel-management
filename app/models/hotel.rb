class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates :name, :address, :contact_number, presence: true
  validates :contact_number, length: { is: 10 }
  validates :contact_number, uniqueness: true
end

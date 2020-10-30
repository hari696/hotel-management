class Customer < ApplicationRecord
  validates :name, :email, :phone_number, :address, presence: true
  validates :phone_number, length: { is: 10 }
  validates :email, uniqueness: true
  validates :phone_number, uniqueness: true
end

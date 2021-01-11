class Reservation < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_many :room_reservations
  has_many :rooms, through: :room_reservations
end

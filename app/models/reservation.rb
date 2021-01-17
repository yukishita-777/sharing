class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  # バリデーション
  validates :start_day, presence: true
  validates :finish_day, presence: true
  validates :number, presence: true
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  mount_uploader :image, ImageUploader
  
  # アソシエーション
  has_many :reservations, dependent: :destroy
  has_many :rooms, dependent: :destroy
  
  # バリデーション
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :introduction, length: { in: 0..100 }
end

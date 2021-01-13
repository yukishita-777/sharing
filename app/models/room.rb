class Room < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_many :reservations, dependent: :destroy
  
  def self.search1(search) #両方が入力された場合
    if search
      Room.where('name LIKE(?) or address LIKE(?) or introduction LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%")
    end
  end
  
  def self.search2(search) #エリアのみが入力された場合　住所のみを検索
    if search
      Room.where('address LIKE(?)', "%#{search}%")
    end
  end
  
  def self.search3(search) #キーワードのみが入力された場合　住所をのぞいて検索
    if search
      Room.where('name LIKE(?) or introduction LIKE(?)', "%#{search}%", "%#{search}%")
    end
  end
  
  def self.search4 
      Room.all
  end
  
  mount_uploader :image, ImageUploader
end

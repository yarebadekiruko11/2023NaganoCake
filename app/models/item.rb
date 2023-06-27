class Item < ApplicationRecord

  # 画像許可
  has_one_attached :image
  # アソシエーション
　has_many :cart_items, dependent: :destroy
　has_many :order_ditails, dependent: :destroy



end

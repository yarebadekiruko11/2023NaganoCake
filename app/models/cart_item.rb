class CartItem < ApplicationRecord
  # 画像許可
  has_one_attached :image

  # アソシエーション
  belongs_to :customer
  belongs_to :item

 def subtotal
   item.with_tax_price * amount
 end

end

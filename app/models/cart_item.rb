class CartItem < ApplicationRecord
  # 画像許可
  has_one_attached :image

  # アソシエーション
  belongs_to :customer
  belongs_to :item

 def subtotal
   item.with_tax_price * amount
  # item.number_to_currency * amount
 end

 def subtotal_k
   "#{subtotal.to_s(:delimited)}"
 end


end

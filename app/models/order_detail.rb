class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

 def subtotal
   item.with_tax_price * amount
  # item.number_to_currency * amount
 end

 def subtotal_k
   "#{subtotal.to_s(:delimited)}"
 end

  # 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end

  # カンマ区切り
  def number_to_currency
    "#{with_tax_price.to_s(:delimited)}"
  end




end

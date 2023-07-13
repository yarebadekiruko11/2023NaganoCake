class Item < ApplicationRecord
# アソシエーション
  has_many :cart_items, dependent: :destroy
  has_many :order_ditails, dependent: :destroy

  # 画像許可
  has_one_attached :image

  def get_image
   unless image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
    image
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

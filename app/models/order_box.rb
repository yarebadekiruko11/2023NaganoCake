class OrderBox < ApplicationRecord
  enum payment_method:{クレジット: 0,銀行振込: 1}
  has_many :order_ditails, dependent: :destroy
  # belongs_to :user

end

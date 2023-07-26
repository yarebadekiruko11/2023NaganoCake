class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  validates :name, presence: true
  validates :address, presence: true



  def address_display
    '〒' + postal_code + ' ' + address
  end

end

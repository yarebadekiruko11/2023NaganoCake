class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_ditails, dependent: :destroy


end

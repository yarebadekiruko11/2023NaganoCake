class OrderDetail < ApplicationRecord
  belongs_to :order_box
  belongs_to :item


end

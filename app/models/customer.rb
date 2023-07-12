class Customer < ApplicationRecord
    # アソシエーション
  has_many :cart_items, dependent: :destroy
  has_many :order, dependent: :destroy


  def active_for_authentication?
    super && (is_deleted == false)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

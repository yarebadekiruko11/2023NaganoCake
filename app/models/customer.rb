class Customer < ApplicationRecord
    # アソシエーション
  has_many :cart_items, dependent: :destroy
  has_many :order, dependent: :destroy

validates :last_name, presence: true
validates :first_name, presence: true
validates :last_name_kana, presence: true
validates :first_name_kana, presence: true
validates :email, presence: true
validates :encrypted_password, presence: true
validates :postal_code, presence: true
validates :address, presence: true
validates :telephone_number, presence: true



  def active_for_authentication?
    super && (is_deleted == false)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name
    last_name + first_name
  end


  def address_display
    '〒' + postal_code + ' ' + address
  end


end

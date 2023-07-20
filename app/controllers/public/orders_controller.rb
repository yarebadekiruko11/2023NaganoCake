class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  # 支払い方法選択、宛先確認画面
  def new
    @order = Order.new
  end

# 　注文商品情報等確認画面
  def confirm
    @order = current_customer.order.new(order_params)


    @cart_items = current_customer.cart_items
    @shipping_cost = 800
    @total = 0
  end

  def complete
  end

  def create

    order.save
    redirect_to confirm_path

  end

  def index
  end

  def show
  end

   private

  def order_params
      params.require(:order).permit(:payment_method, :address)
  end




end

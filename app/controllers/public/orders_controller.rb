class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  # 支払い方法選択、宛先確認画面
  def new
    cart_items = current_customer.cart_items
    if cart_items.present?
     @order = Order.new
    else
     redirect_to cart_items_path
    end
  end

# 　注文商品情報等確認画面
  def confirm
    @order = current_customer.order.new(order_params)
    @cart_items = current_customer.cart_items
    @shipping_cost = 800
    @total = 0



  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.name = current_customer.name
    if @order.save!
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new(order_id: @order.id)
        order_detail.item_id = cart_item.item_id
        order_detail.price = cart_item.subtotal_k
        order_detail.amount = cart_item.amount
        order_detail.save!
      end
      @cart_items.destroy_all
      redirect_to orders_complete_path
    else
      render "new"
    end
  end



  def complete
  end



  def index
    @orders = current_customer.order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = @order_details.inject(0) { |sum, order_detail| sum + order_detail.subtotal }

    # @total = 0
    # @total += order_detail.subtotal
    # @order_details = @order.order_details.all
  end

   private

  def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end




end

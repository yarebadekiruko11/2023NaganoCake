class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page])
    @count = 0
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = @order_details.inject(0) { |sum, order_detail| sum + order_detail.subtotal }
  end

  def customer_index
    @customer = Customer.find(params[:id])
    @orders = @customer.order.all.page(params[:page])


  end

end

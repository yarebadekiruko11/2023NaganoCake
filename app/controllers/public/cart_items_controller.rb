class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!


  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }

  end

  def update
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to cart_items_path

  end


  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
     redirect_to cart_items_path
    else
     flash[:notice] = "ログインしてください"
     redirect_to customer_session_path
    end

  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end

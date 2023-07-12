class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!


  def index
    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }

  end

  def update
  end

  def destroy
  end

  def destroy_all
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

class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!


  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
    @total = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
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
    # cart内にすでに存在する商品かを確認
    cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])

    # あったらすでにあるものに追加
    if cart_item.present?
      cart_item.amount += params[:cart_item][:amount].to_i
    # なかったら新規作成する
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id

      # current_customer.cart_items.new(cart_item_params)
    end

    # 保存
    cart_item.save

    # cart画面にリダイレクトする
    redirect_to cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end


end

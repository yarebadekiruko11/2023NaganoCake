class Public::ItemsController < ApplicationController
  def index
    @itemcount = Item.count
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end
end

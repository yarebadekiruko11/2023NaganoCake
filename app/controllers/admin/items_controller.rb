class Admin::ItemsController < ApplicationController
    before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
    redirect_to admin_item_path(item.id)
    else
    flash.now[:notice] = "項目を入力してください"
    @item = Item.new
    render :new
    end
  end

  def show
   @item = Item.find(params[:id])
  end

  def edit
   @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
    flash.now[:notice] = "編集を保存しました"
    redirect_to admin_item_path(item.id)
    else
    @item = Item.find(params[:id])
    flash.now[:notice] = "項目を埋めてください"
    render :edit
    end

  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end



end

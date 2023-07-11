class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item.id)
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
    flash[:notice] = "編集を保存しました"
    redirect_to admin_item_path(item.id)
    else
    flash[:notice] = "保存できません"
    render :edit
    end

  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end



end

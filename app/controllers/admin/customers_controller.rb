class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
     flash.now[:notice] = "編集を保存しました"
     redirect_to admin_customers_path
    else
      flash.now[:notice] = "入力してください"
     render :edit
    end
  end

  private


  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end






end

class Public::CustomersController < ApplicationController



  def show
    @customer = current_customer

  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
    flash.now[:notice] = "編集を保存しました"
    redirect_to my_page_path
    else
    render :edit
    end
  end


  def unsubscribe
    # 退会確認画面へ

  end

  def withdraw

    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash.now[:notice] = "退会処理を実行いたしました"
    redirect_to root_path

  end

  private


  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end



end

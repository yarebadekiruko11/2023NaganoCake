class Public::CustomersController < ApplicationController



  def show
    @customer = current_customer

  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update
    flash[:notice] = "You have updated user successfully."
    redirect_to current_customer_show_path
    else
    render :edit
    end
  end


  def unsubscribe
  end

  def withdraw
  end

  private


  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end



end

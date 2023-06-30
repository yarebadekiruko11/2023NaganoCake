
# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  # before_action :customer_state, only: [:create]

   before_action :configure_permitted_parameters, if: :devise_controller?

   before_action :configure_sign_in_params, only: [:create]
  # def after_sign_in_path_for(resource)
    # customer_path(current_user)
  # end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

   protected

    def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
    end





  # 退会しているか判断
 def cutomer_state
  # 入力されたメールからアカウントを１件取得
  @customer = Customer.find_by(email: params[:customer][:email])
  #アカウント取得できず。終了
   return if !@customer

  #取得アカウントのパスワードと入力されたパスワードが一致しているかどうか
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == false)
    #処理分岐
    redirect_to new_customer_registration
    end
 end





  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

end
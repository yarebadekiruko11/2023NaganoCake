Rails.application.routes.draw do


 # 顧客用
  # url /customers/sign_in...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

 # 管理者用
  # url /admin/sign/in...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # トップ画面
  root to: "public/homes#top"

# 会員用
  scope module: :public do
    get 'homes/about'

    # 商品画面
    resources :items, only: [:index, :show]

    # 会員情報編集等
    get 'my_page' => "customers#show"
    get 'customers/information/edit' => "customers#edit"
    patch 'customers/information' => "customers#update"
    # 退会確認画面
    get 'customers/unsubscribe'
    # 退会処理
    patch 'customers/withdraw'

    # カート
    resources :cart_items, only:[:index, :update, :destroy, :create]
    delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'


    # 注文関係
    post 'orders/confirm' => 'orders#confirm', as: 'orders_confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only:[:new, :create, :show, :index]




  end

# 管理者用
  namespace :admin do

    # トップ画面(order一覧)
    get 'homes/top'

    # 商品関係
    resources :items, except: [:destroy]

    # 会員情報
    resources :customers, only: [:index, :show, :edit, :update]

    # 注文関係
    resources :orders, only: [:show, :index]
    get 'orders/customer_index/:id' => 'orders#customer_index', as: 'orders_customer'




    # get 'order_details/update'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

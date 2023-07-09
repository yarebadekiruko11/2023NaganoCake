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
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'

    # 注文関係
    get 'orders/new'
    get 'orders/comfirm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders' => "orders#index"
    get 'orders/show'
  end

# 管理者用
  namespace :admin do

    # トップ画面(order一覧)
    get 'homes/top'

    # 商品関係
    resources :items, except: [:destroy]

    # 会員情報
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'

    # 注文関係
    get 'orders/index'
    get 'orders/show'






    # get 'order_details/update'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

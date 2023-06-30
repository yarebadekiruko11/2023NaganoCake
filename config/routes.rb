Rails.application.routes.draw do



  namespace :public do
    get 'orders/new'
    get 'orders/comfirm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
  end
  namespace :admin do
    get 'order_details/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
  namespace :public do
    resources :items, only: [:index, :show]


  end
  namespace :admin do
    resources :items, except: [:destroy]

    # get 'items/index'
    # get 'items/new'
    # get 'items/create'
    # get 'items/show'
    # get 'items/edit'
    # get 'items/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # 管理者用
  # url /admin/sign/in...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用
  # url /customers/sign_in...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

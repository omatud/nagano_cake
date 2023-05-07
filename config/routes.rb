Rails.application.routes.draw do

 

  # 顧客用
# URL /customers/sign_in ...


# 管理者用
# URL /admin/sign_in ...
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



  namespace :admin do
    resources :items, only: [:index, :show, :create, :new, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_histories, only: [:show, :update]
    resources :order_history_details, only: [:update]

    get 'top'=>'homes#top'

  end

  scope module: :public do
    
    root to: "homes#top"
    get "home/about" => "homes#about"
    post 'orders/confirm'=>'orders#confirm'
    get 'orders/complete'=>'orders#complete'
    get 'customers/unsubscribe'=>'customers#unsubscribe'
    patch 'customers/withdraw'=>'customers#withdraw'
    delete 'cart_items/destroy_all'=>'cart_items#destroy_all'
    resources :items, only: [:index, :show]
    resource :customers, only: [:show, :edit, :update]
    resources :cart_items, only: [:index, :destroy, :create, :update]
    resources :orders, only: [:index, :show, :create, :new]
    resources :addresses, only: [:index, :destroy, :create,  :edit, :update]

  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


end

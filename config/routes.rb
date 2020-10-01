Rails.application.routes.draw do
  devise_for :admins
  devise_for :end_users

  root 'items#index'
  get "/about" => "abouts#about"
  get 'items/:id' => 'items#show'
  resources :end_users, only: [:edit, :update]
  get 'end_users/my_page' => 'end_users#show'
  get 'end_users/unsubscribe' => 'end_users#unsubscribe'
  patch 'end_users/withdraw' => 'end_users#withdraw'
  resources :cart_items, only: [:index, :update, :destroy, :create ]
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :orders, only: [:new, :create, :index, :show ]
  get 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
  resources :addresses, only: [:index, :edit ]

  get 'admins' => 'admins#top'

     namespace :admins do
        resources :items, only: [:index, :new, :create, :show, :edit, :update ]
        resources :genres, only: [:index, :create, :edit, :update ]
        resources :end_users, only: [:index, :show, :edit, :update ]
        patch 'admins/end_users/:id/unsubscribe' => 'admins/end_users#unsubscribe'
        resources :orders, only: [:index, :show, :update ]
        resources :order_details, only: [:update]
     end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  devise_for :end_users, skip: :all
    devise_scope :end_user do
      get 'end_users/sign_in' => 'end_users/end_users/sessions#new', as: 'new_end_user_session'
      post 'end_users/sign_in' => 'end_users/end_users/sessions#create', as: 'end_user_session'
      delete 'end_users/sign_out' => 'end_users/end_users/sessions#destroy', as: 'destroy_end_user_session'
      get 'end_users/sign_up' => 'end_users/end_users/registrations#new', as: 'new_end_user_registration'
      post 'end_users' => 'end_users/end_users/registrations#create', as: 'end_user_registration'
      get 'end_users/password/new' => 'end_users/end_users/passwords#new', as: 'new_end_user_password'
  end

      root 'items#top'
      get "/about" => "abouts#about"
      resources :items, only: [:index, :show]
      patch 'end_users/withdraw' => 'end_users#withdraw'
      resources :end_users, only: [:edit, :update]
      get 'end_users/my_page' => 'end_users#show'
      get 'end_users/unsubscribe' => 'end_users#unsubscribe'

      resources :cart_items, only: [:index, :update, :destroy, :create ] do
        collection do
          delete 'destroy_all'
        end
      end

      delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
      get 'orders/complete' => 'orders#complete' ,as: 'order_complete'
      resources :orders, only: [:new, :create, :index, :show ]
      post 'orders/confirm:id' => 'orders#confirm' ,as: 'order_comfirm'

      resources :addresses, only: [:index, :edit, :create, :update, :destroy ]

      get 'admins' => 'admins#top'

  namespace :admins do
      resources :items, only: [:index, :new, :create, :show, :edit, :update ]
      resources :genres, only: [:index, :create, :edit, :update ]
      resources :end_users, only: [:index, :show, :edit, :update ]
      patch 'admins/end_users/:id/unsubscribe' => 'admins/end_users#unsubscribe'
      resources :orders, only: [:index, :show, :update ]
      resources :order_details, only: [:update]
  end


  devise_for :admins, skip: :all
    devise_scope :admin do
      get 'admins/sign_in' => 'admins/admins/sessions#new', as: 'new_admin_session'
      post 'admins/sign_in' => 'admins/admins/sessions#create', as: 'admin_session'
      delete 'admins/sign_out' => 'admins/admins/sessions#destroy', as: 'destroy_admin_session'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'items#index'

  resources :items, only: [:index, :new, :create] do
    collection do
      get 'index'
      get 'purchase'
      get 'sell'
      get 'item_details'
    end
  end

  resources :mypages do
    collection do
      get 'index'
      get 'creditcard'
      get 'logout'
      get 'payment'
    end
  end

end

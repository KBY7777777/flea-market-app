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

      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end

    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
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

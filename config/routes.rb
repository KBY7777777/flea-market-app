Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'items#index'

  resources :items do

    collection do
      get 'display'
      get 'sell'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end

    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end

    resources :purchases, only: [:new, :create]
    

  end

  resources :mypages , only: :show do
    collection do
      get 'index'
      get 'display'
      get 'creditcard'
      get 'logout'
      get 'payment'
      get 'buy_display'
    end
  end

  #クレカ情報関連のrouting
  resources :cards, only: [:index, :new, :show] do
    collection do
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

end

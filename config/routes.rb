Rails.application.routes.draw do
  root 'items#index'

  resources :items do    #商品情報関連の「items」controllerに対応
    collection do
      get 'purchase'    #商品購入確認ページ
      get 'sell'    #商品出品ページ
      get 'item_details'    #商品詳細ページ
    end
  end

  resources :users do    #ユーザー情報関連の「users」controllerに対応
    collection do
      get 'login'    #ログインページ
    end
  end

end

Rails.application.routes.draw do
  root 'items#index'

  resources :users do    #ユーザー情報関連の「users」controllerに対応
    collection do
      get 'index'    #必要時に使用
      put 'index'
      get 'login'    #ログインページ
      put 'login'
    end
  end

end

Rails.application.routes.draw do
  root 'items#index'

  get "users/login" => "users#login"    #ユーザーログイン画面の表示
  get "items/purchase" => "items#purchase"    #商品購入確認画面の表示
  get "items/sell" => "items#sell"    #商品出品画面の表示

end

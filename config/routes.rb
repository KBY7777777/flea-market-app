Rails.application.routes.draw do
  root 'items#index'

  get "users/login" => "users#login"    #ユーザーログイン画面の表示

end

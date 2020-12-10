#商品購入機能のモデル単体テストデータ

FactoryBot.define do

  factory :purchase do

    item_id    {1}    #出品商品のID
    user_id    {1}    #購入者のuser_id

    association :user
    association :item

  end

end



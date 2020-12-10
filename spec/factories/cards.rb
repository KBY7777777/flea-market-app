#クレカ登録機能のモデル単体テストデータ

FactoryBot.define do
  factory :card do

    user_id        {1}
    customer_id    {2}
    payjp_id       {3}

  end
end



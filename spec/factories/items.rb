FactoryBot.define do

  factory :item do
    # item_image         {""}    #追って画像添付の単体テスト時に設定する
    item_name          {"ぐ"}
    item_text          {"ぐ"}
    category_id        {702}
    brand              {"ぐ"}
    item_status        {"1"}
    delivery_charge    {"1"}
    delivery_area      {"1"}
    delivery_day       {"1"}
    price              {"300"}
    association :user
    association :category

  end

end



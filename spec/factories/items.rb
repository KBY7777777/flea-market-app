FactoryBot.define do

  factory :item do
    id                 {1}    #user_id
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

    after(:build) do |built_item|    #画像添付対応
      built_item.item_images << build(:item_image, item: built_item)
    end

    after(:build) do |item|    #category_idからカテゴリー情報の呼び出し
      parent = create(:category)
      child_category = parent.children.create(name: "child")
      grand_child_category = child_category.children.create(name: "grandchild")
      item.category_id = grand_child_category.id

    end

  end

end



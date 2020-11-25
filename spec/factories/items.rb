FactoryBot.define do

  factory :item do
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

    after(:build) do |built_item|
      built_item.item_images << build(:item_image, item: built_item)
    end

  end

end



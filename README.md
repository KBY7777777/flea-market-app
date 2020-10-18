## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail	|string|null: false|default: “”|
|password|string|null: false|default: “”|
|encrypted_password|string|null: false|default: “”|
|family_name|string|null: false|
|first_name|string|null: false|
|familyname_furigana|string|null: false|
|firstname_furigana|string|null: false|
|date |string|null: false|

### Association
- has_one :adress,dependent: :destroy
- has_many :items,dependent: :destroy
- has_one :purchase_management


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|item_text|text|null: false|
|category_id|references|null: false,foreign_key:true|
|brand_id|references|null: false,foreign_key:true|
|item_status_id(active_hash)|integer|null: false|
|delivery_charge_id(active_hash)|integer|null: false|
|delivery_area_id(active_hash)|integer|null: false|
|delivery_day_id(active_hash)|integer|null: false|
|price|integer|null: false|
|user_id|references|null: false,foreign_key:true|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :item_images,dependent: :destroy
- belongs_to_active_hash :item_status
- belongs_to_active_hash :delivery_charge
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :delivery_day
- has_one :purchase_management


## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|url|string|null: false|

### Association
- belongs_to :item

## purchase_managementテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to:user
- belongs_to:item


## adresseesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|destination_family_name|string|null: false|
|destination_first_name|string|null: false|
|destination_family_name_furigana|string|null: false|
|destination_first_name_furigana|string|null: false|
|postal_code|string|null: false|
|prefectures_area|integer|null: false|default:""|
|municipality|string|null: false|
|house_number|string|null: false|
|house_number|string|
|tel|string|unique: true|

### Association
- belongs_to :user


## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :items


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


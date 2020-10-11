## usersテーブル
|Column|Type|Options|
|------|----|-------|
## ニックネーム
|nickname|string|null: false|
## メールアドレス
|mail	|string|null: false|default: “”|
## パスワード
|password|string|null: false|default: “”|
## パスワード確認
|encrypted_password|string|null: false|default: “”|
## ユーザーの苗字
|family_name|string|null: false|
## ユーザーの名前
|first_name|string|null: false|
## ユーザーの苗字のふりがな
|familyname_furigana|string|null: false|
## ユーザーの名前のふりがな
|firstname_furigana|string|null: false|
## 生年月日
|date |string|null: false|

### Association
- has_one :adressee,dependent: :destroy
- has_one :credit_card,dependent: :destroy
- has_many :items,dependent: :destroy


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
## 商品名
|nickname|string|null: false|
## 商品の説明
|item_text|text|null: false|
## カテゴリー
|category_id|references|null: false,foreign_key:true|
## ブランド
|brand_id|references|null: false,foreign_key:true|
## 商品の状態
|item_status_id|integer|null: false|
## 配送料の負担
|delivery_charge_id|integer|null: false|
## 配送元の地域
|delivery_area_id|integer|null: false|
## 配送までの日数
|delivery_day_id|integer|null: false|
## 価格
|price|integer|null: false|
## user_id（売り手）
|user_id|references|null: false,foreign_key:true|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :item_images,dependent: :destroy


## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
## item_id
|item_id|references|null: false, foreign_key: true|
## url
|url|string|null: false|

### Association
- belongs_to :item


## adresseesテーブル
|Column|Type|Options|
|------|----|-------|
## user_id
|user_id|references|null: false, foreign_key: true|
## 送付先名字
|destination_family_name|string|null: false|
## 送付先名前
|destination_first_name|string|null: false|
## 送付先名字ふりがな
|destination_family_name_furigana|string|null: false|
## 送付先名字ふりがな
|destination_first_name_furigana|string|null: false|
## 郵便番号
|postal_code|integer(7)|null: false|
## 都道府県
|prefectures_area|integer|null: false|default:""|
## 市区町村
|municipality|string|null: false|
## 番地
|house_number|string|null: false|
## マンション名やビル名、部屋番号（任意）
|house_number|string|
## お届け先電話番号（任意）
|tel|string|unique: true|

### Association
- belongs_to :user


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
## user_id
|user_id|references|null: false, foreign_key: true|
## カード番号
|card_num|integer|null: false, foreign_key: true|
## 有効期限
|expiration_dateinteger|null: false, foreign_key: true| 
## セキュリティコード
|security_code|null: false, foreign_key: true| 

### Association
- belongs_to: user


## categorysテーブル
|Column|Type|Options|
|------|----|-------|
## name
|name|string|null: false|
## ancestry
|ancestry|string|null: false|

### Association
- has_many :items


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
## name
|name|string|null: false|

### Association
- has_many :items

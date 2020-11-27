class Address < ApplicationRecord
  validates :destination_family_name,
  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角ひらがな、全角カタカナ、漢字のみが使用できます"},
  presence: true
  validates :destination_first_name,
  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角ひらがな、全角カタカナ、漢字のみが使用できます"},
  presence: true
  validates :destination_family_name_furigana,
  format: { with: /\A([ァ-ン]|ー)+\z/, message: "全角カタカナのみが使用できます"},
  presence: true
  validates :destination_first_name_furigana,
  format: { with: /\A([ァ-ン]|ー)+\z/, message: "全角カタカナのみが使用できます"},
  presence: true
  validates :postal_code,
  format: { with: /\A\d{3}[-]\d{4}\z/,message: "ハイフン入り７桁で入力してください"},
  presence: true
  validates :prefectures_area, presence: true
  validates :municipality, presence: true
  validates :house_number, presence: true
  # validates :tel,
  # format: { with: /\A\d{10}\z/, message: "半角数字のみが使用できます"}
  validates :tel, numericality: { allow_blank: true, message: "半角数字のみが使用できます"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
end

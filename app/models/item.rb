class Item < ApplicationRecord
  validates :item_name,
    length: {maximum: 40},
    presence: true
  validates :item_text,
    length: {maximum: 1000},
    presence: true
  # validates :category_id,      presence: true    #L19「belongs_to :category」の設定で含まれるので削除
  validates :item_status,      presence: true
  validates :delivery_charge,  presence: true
  validates :delivery_area,    presence: true
  validates :delivery_day,     presence: true
  validates :price, 
    numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},
    presence: true


  belongs_to :user
  belongs_to :category
  has_many :item_images,dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  validates :item_images, presence: true
  #validates_associated :item_images
  # has_one :purchase_management

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :itemstatus
  belongs_to_active_hash :deliverycharge
  belongs_to_active_hash :deliveryarea
  belongs_to_active_hash :deliveryday
end

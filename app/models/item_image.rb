class ItemImage < ApplicationRecord
  validates :url, presence: true  #空NG
  mount_uploader :url, ImageUploader


  belongs_to :item, optional: true
end

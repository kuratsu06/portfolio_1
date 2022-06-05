class Image < ApplicationRecord
  validates :product_id, presence: true
  validate :images, presence: true

  belongs_to :product

  mount_uploader :image, ImageUploader
end

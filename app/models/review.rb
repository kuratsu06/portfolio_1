class Review < ApplicationRecord
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :comment, presence: true, length: { maximum: 200 }

  belongs_to :user
  belongs_to :product
end

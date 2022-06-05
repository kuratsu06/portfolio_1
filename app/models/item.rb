class Item < ApplicationRecord
  validates :product_id, presence: true
  validates :cart_id, presence: true
  validates :quantity, presence: true

  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end
end

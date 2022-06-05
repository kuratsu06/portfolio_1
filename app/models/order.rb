class Order < ApplicationRecord
  validates :product_id, presence: true
  validates :purchase_id, presence: true
  validates :quantity, presence: true
  validates :subtotal, presence: true

  belongs_to :product
  belongs_to :purchase
end

class Purchase < ApplicationRecord
  validates :user_id, presence: true
  validates :total_amount, presence: true

  belongs_to :user
  has_many :orders, dependent: :destroy
end

class Cart < ApplicationRecord
  validates :user_id, presence: true

  belongs_to :user
  has_many :items, dependent: :destroy
end

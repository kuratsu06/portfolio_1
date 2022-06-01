class Product < ApplicationRecord
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end
end

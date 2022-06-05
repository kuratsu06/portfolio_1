class Product < ApplicationRecord
  belongs_to :category
  has_many :items, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end

  def self.search(search)
    if search
      Product.where(['name LIKE ?', "%#{search}%"])
    else
      Product.all
    end
  end
end

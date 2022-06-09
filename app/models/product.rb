class Product < ApplicationRecord
  validates :category_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { maximum: 300 } 

  belongs_to :category
  has_many :items, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_associated :images

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user)
  end

  def self.search(search)
    if search
      Product.where(['name LIKE ?', "%#{search}%"])
    else
      Product.all
    end
  end
end

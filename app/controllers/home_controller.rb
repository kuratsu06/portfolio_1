class HomeController < ApplicationController
  def top
    @categories = Category.includes(:products).where(ancestry: nil)
    products = Product.order(updated_at: :desc).limit(4)
  end

  def plofile
    @user = current_user
    @categories = Category.where(ancestry: nil)
  end

  def bookmark
    @categories = Category.where(ancestry: nil)
    @favorites = Favorite.where(user_id: current_user.id)
  end
end

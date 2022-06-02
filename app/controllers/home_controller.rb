class HomeController < ApplicationController
  def top
    @categories = Category.includes(:products).where(ancestry: nil)
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

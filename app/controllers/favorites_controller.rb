class FavoritesController < ApplicationController
  before_action :authenticate_user! 

  def create
    @product = Product.find(params[:product_id])
    @favorite = @product.favorites.create(user_id: current_user.id)
    
    if @favorite.save
      flash[:norice] = "お気に入りに登録しました"
      redirect_to product_path(@product)
    else
      flash.now[:alert] = "お気に入りを登録できませんでした"
      render "products/show"
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @favorite = @product.favorites.find_by(user_id: current_user.id)
    
    @favorite.destroy
      flash[:norice] = "お気に入りを解除しました"
      redirect_to product_path(@product)
  end
end

class HomeController < ApplicationController
  def top
    @categories = Category.where(ancestry: nil)
    @product = Product.all
  end
end

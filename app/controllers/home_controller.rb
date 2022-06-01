class HomeController < ApplicationController
  def top
    @categories = Category.includes(:products).where(ancestry: nil)
  end
end

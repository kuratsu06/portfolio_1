class ReviewsController < ApplicationController
	before_action :authenticate_user! 
  before_action :side_bar, only: %i( index new create )

  def index
    @reviews = Review.where(user_id: current_user.id)
  end

  def new
    @review = Review.new
    @user = User.find_by(params[:user_id])
    @product = Product.find(params[:product_id])
  end

  def create
    @review = Review.new(review_params)
    @user = User.find(params[:review][:user_id])
    @product = Product.find(params[:review][:product_id])

    if @review.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to reviews_path
    else
      flash[:alert] = "投稿に失敗しました"
      render 'products/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])

    @review.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to reviews_path
  end

  private
    def review_params
      params.require(:review).permit(:user_id, :product_id, :comment)
    end

    def side_bar
      @categories = Category.where(ancestry: nil)
    end
end

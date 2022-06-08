class CartsController < ApplicationController
  before_action :cart_item, only: %i(create update destroy)

  def show
    @items = current_cart.items.includes([:product])
    @total_price = @items.inject(0) { |sum, item| sum + item.total_price }
    @categories = Category.where(ancestry: nil)
  end

  def create
    @item ||= current_cart.items.build(product_id: params[:product_id])
    @item.quantity += params[:quantity].to_i

    if  @item.save
      flash[:notice] = "商品がカートに追加されました"
      redirect_to my_cart_path
    else
      flash[:alert] = "商品の追加に失敗しました"
      redirect_to product_url(params[:product_id])
    end
  end

  def update
    if @item.update(quantity: params[:quantity].to_i)
      flash[:notice] = "カート内の商品が更新されました"
    else
      flash[:alert] = "カート内の更新に失敗しました"
    end
    redirect_to my_cart_path
  end

  def destroy
    if @item.destroy
      flash[:notice] = "カート内の商品が削除されました"
    else
      flash[:alert] = "削除に失敗しました"
    end
    redirect_to my_cart_path
  end

  private
    def cart_item
      @item = current_cart.items.find_by(product_id: params[:product_id])
    end
end

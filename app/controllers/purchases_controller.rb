class PurchasesController < ApplicationController
  before_action :side_bar, only: %i[ index new create ]
	
	def index
		@purchases = Purchase.where(user_id: current_user.id)
	end

	def new
  	@purchase = Purchase.new
		@items = current_cart.items.all
  	@total = @items.inject(0) { |sum, product| sum + product.total_price }
	end

	def create
  	@items = current_cart.items.all
  	@purchase = Purchase.new(purchase_params)
  	if @purchase.save
    	@items.each do |item|
      	order = Order.new
      	order.product_id = item.product_id
      	order.purchase_id = @purchase.id
				order.quantity = item.quantity
      	order.subtotal = item.product.price
      	order.save
    	end
			flash[:notice] = "注文が確定しました"
    	redirect_to purchases_path
    	@items.destroy_all
  	else
    	@purchase = Purchase.new(purchase_params)
			flash[:alert] = "注文が完了しませんでした"
    	render :new
  	end
	end

  def destroy
    @purchase = Purchase.find(params[:id])
    now = Time.current 
    
    if (now.since(1.hours) >= @purchase.created_at)
      if @purchase.destroy
        flash[:notice] = "注文がキャンセルされました"
      else
        flash[:alert] = "注文のキャンセルに失敗しました"
      end
      redirect_to purchases_path
    else
      flash[:alert] = "申し訳ございません。注文が確定してから1時間を過ぎましたので、お電話にてご連絡ください"
			redirect_to purchases_path
    end
  end

	private
		def purchase_params
  		params.require(:purchase).permit(:user_id, :total_amount)
		end

    def side_bar
      @categories = Category.where(ancestry: nil)
    end
end

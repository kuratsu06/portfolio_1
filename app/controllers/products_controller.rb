class ProductsController < ApplicationController
  before_action :if_not_admin, only: %i( new create edit destroy)
  before_action :set_product, only: %i( show edit update destroy )
  before_action :side_bar, only: %i( index show new edit create update )

  # GET /products or /products.json
  def index
    @products = Product.search(params[:search])
  end

  # GET /products/1 or /products/1.json
  def show
    @favorite = Favorite.new
    category = @product.category
    @products = Product.where(category_id: category.id).where.not(id: @product.id).distinct
  end

  # GET /products/new
  def new
    @product = Product.new
    @images = @product.images.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "管理者が商品を登録しました" }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "管理者が商品を更新しました" }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "管理者が商品を削除しました" }
      format.json { head :no_content }
    end
  end

  private
    def if_not_admin
      redirect_to root_path unless current_user.admin?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def side_bar
      @categories = Category.where(ancestry: nil)
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:category_id, :name, :price, :description, images_attributes: [:image])
    end
end

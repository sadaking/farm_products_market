class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "出品完了しました！"
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path, notice: "商品情報を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice:"商品を削除しました！"
  end

  private

  def product_params
    params.require(:product).permit(
      :title,
      :price,
      :quantity,
      :image,
      :content,
      :category,
      :harvest_date,
      :farm_name,
      :farm_street_address)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

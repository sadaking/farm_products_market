class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all

    if params[:search].present?
      @products = Product.title_search(params[:title])
    end

    if params[:label_id].present?
      @products = @products.joins(:labels).where(labels: { id: params[:label_id] })
    end
  end

  def new
    @product = current_producer.products.build
  end

  def create
    @product = current_producer.products.build(product_params)
    if @product.save
      redirect_to products_path, notice: "出品完了しました！"
    else
      render :new
    end
  end

  def show
    @comments = @product.comments
    @comment = @product.comments.build
  end

  def edit
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
      :farm_street_address,
      label_ids: [])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

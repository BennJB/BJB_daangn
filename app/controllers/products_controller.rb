class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @products = Product.order(id: :desc).page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    
    if @product.save
      redirect_to product_path(@product), notice: '물품을 등록했습니다'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :description, :image, :image_cache)
  end
end

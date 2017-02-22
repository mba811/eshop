class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :require_is_admin
  layout "admin"


  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @main_categories = Category.main_categories
    @subcategories = Category.where(:parent_category_id => @main_categories.first.id)
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])

    @main_categories = Category.main_categories
    @subcategories = Category.where(:parent_category_id => @main_categories.first.id)
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Product Updated."
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product deleted."
    redirect_to admin_products_path
  end

  def onsale
    @product = Product.find(params[:id])
    @product.onsale!

    redirect_to :back
  end

  def notsale
    @product = Product.find(params[:id])
    @product.notsale!

    redirect_to :back
  end


  private

    def product_params
      params.require(:product).permit(:title, :description, :price, :quantity, :photo, :onsale, :category_id)
    end
end

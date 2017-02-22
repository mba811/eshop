class CategoriesController < ApplicationController

  def index
    @main_categories = Category.main_categories
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.where(:onsale => true,
                              :category_id => @category.id).order("created_at DESC")
  end

end

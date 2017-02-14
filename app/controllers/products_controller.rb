class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)

    redirect_to :back
  end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 2)
    end
  end

  protected

    def validate_search_key
      @query_string = params[:q].gsub(/\\|\'|-|\/|\.|\?/, "") if params[:q].present?
      @search_criteria = {
        :title_cont => @query_string
      }

    end

  

end

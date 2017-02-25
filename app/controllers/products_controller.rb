class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]
  # before_action :set_search

  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 12)
    @slides = Banner.where("is_hidden = ? AND is_slide = ?", false, true )
    @banners = Banner.where("is_hidden = ? AND is_slide = ?", false, false ).order("created_at 
                           DESC").limit(2)
    # @q = Product.ransack(params[:q])
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)

    redirect_to :back
  end

  def search
    if @query_string.present?
      @q = Product.ransack(@search_criteria)
      @products = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 12)
    end

    # @q = Product.ransack(params[:q])
    # @products = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 12)

  end



  protected

    def validate_search_key
      @query_string = params[:q].gsub(/\\|\'|-|\/|\.|\?/, "") if params[:q].present?
      @search_criteria = {
        :title_cont => @query_string
      }

    end


    #
    # def set_search
    #   @q = Product.search(params[:id])
    # end



end

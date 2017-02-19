class Admin::BannersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :require_is_admin
  layout "admin"

  def index
    @banners = Banner.all.order("created_at DESC")
  end

  def new
    @banner = Banner.new
  end

  def create 
    @banner = Banner.new(banner_params)

    if @banner.save
      redirect_to admin_banners_path, :notice => "Banner Created."
    else
      render :new
    end
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    if @banner.update(banner_params)
      redirect_to admin_banners_path, :notice => "Banner Updated"
    else
      render :edit
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy
    flash[:danger] = "Banner Deleted."
    redirect_to admin_banners_path
  end

  def hide
    @banner = Banner.find(params[:id])
    @banner.is_hidden = true
    @banner.save
    redirect_to :back
  end

  def publish
    @banner = Banner.find(params[:id])
    @banner.is_hidden = false
    @banner.save
    redirect_to :back
  end

  def do_slide
    @banner = Banner.find(params[:id])
    @banner.is_slide = true
    @banner.save
    redirect_to :back
  end

  def undo_slide
    @banner = Banner.find(params[:id])
    @banner.is_slide = false 
    @banner.save
    redirect_to :back
  end

  private

    def banner_params
      params.require(:banner).permit(:title, :description, :cover, :link, :is_slide, :is_hidden)
    end
end

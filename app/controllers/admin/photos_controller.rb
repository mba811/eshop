class Admin::PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to edit_admin_product_path(:id => params[:product_id])
  end
end

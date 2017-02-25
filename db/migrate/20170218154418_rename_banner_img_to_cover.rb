class RenameBannerImgToCover < ActiveRecord::Migration[5.0]
  def change
    rename_column :banners, :img, :cover
  end
end

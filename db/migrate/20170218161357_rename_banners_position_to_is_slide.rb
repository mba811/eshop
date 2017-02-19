class RenameBannersPositionToIsSlide < ActiveRecord::Migration[5.0]
  def change
    rename_column :banners, :position, :is_slide
  end
end

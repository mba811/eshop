class AddIsHiddenToBanners < ActiveRecord::Migration[5.0]
  def change
    add_column :banners, :is_hidden, :boolean, default: true
  end
end

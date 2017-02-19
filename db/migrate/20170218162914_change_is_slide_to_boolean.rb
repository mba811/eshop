class ChangeIsSlideToBoolean < ActiveRecord::Migration[5.0]
  def up 
    change_column :banners, :is_slide, :boolean, :default => false
  end

  def down 
    change_column :banners, :is_slide, :string, :default => nil
  end
end

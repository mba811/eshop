class CreateBanners < ActiveRecord::Migration[5.0]
  def change
    create_table :banners do |t|
      t.string :title
      t.text   :description
      t.string :link
      t.string :position, default: "left"
      t.string :img

      t.timestamps
    end
  end
end

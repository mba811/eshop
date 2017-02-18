class AddOnSaleToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :onsale, :boolean, default: false
  end
end

class AddDetailsToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :is_main_category, :boolean, default: false
    add_column :categories, :parent_category_id, :integer
  end
end

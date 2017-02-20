module Admin::CategoriesHelper

  def render_is_main_category(category)
    if category.is_main_category
      "是"
    else
      "否" 
    end
  end
end

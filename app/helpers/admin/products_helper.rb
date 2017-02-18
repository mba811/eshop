module Admin::ProductsHelper
  def render_product_onsale(product)
    if product.onsale
      content_tag(:span, "", :class => "fa fa-globe")
    else
      content_tag(:span, "", :class => "fa fa-lock")
    end
  end
end

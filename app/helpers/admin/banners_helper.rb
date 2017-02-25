module Admin::BannersHelper
  def render_banner_is_hidden(banner)
    if !banner.is_hidden
      content_tag(:span, "", :class => "fa fa-globe")
    else
      content_tag(:span, "", :class => "fa fa-lock")
    end
  end

  def render_banner_is_slide(banner)
    if !banner.is_slide
      content_tag(:span, "", :class => "fa fa-image")
    else
      content_tag(:span, "", :class => "fa fa-video-camera")
    end
  end
end

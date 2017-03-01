class PagesController < ApplicationController
  layout "page"

  def show
    render template: "pages/#{params[:page]}"
  end
end

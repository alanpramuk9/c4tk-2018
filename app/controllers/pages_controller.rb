class PagesController < ApplicationController
  def home; end

  def show
    if valid_page?
      render template: "pages/#{params[:page]}"
    else
      render template: "pages/not_found", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
  end
end
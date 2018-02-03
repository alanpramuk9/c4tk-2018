class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActionController::RoutingError, with: :not_found

  def not_found
    render template: "pages/not_found", status: :not_found
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActionController::RoutingError, with: :not_found
  helper_method :current_user

  def not_found
    render template: "pages/not_found", status: :not_found
  end

protected

  def current_user
    Users[session[:user_id]].tap { |user| p user }
  end

  def params_as_hash(params_obj = params)
    params_obj.to_h.symbolize_keys
  end
end

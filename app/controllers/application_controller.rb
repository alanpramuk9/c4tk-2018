class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActionController::RoutingError, with: :not_found
  helper_method :current_user, :current_idea_board

  def not_found
    render template: "pages/not_found", status: :not_found
  end

protected

  def ensure_logged_in
    redirect_to sign_in_path if current_user.guest?
  end

  def current_user
    Users[session[:user_id]]
  end

  def current_idea_board
    current_user.latest_idea_board
  end

  def params_as_hash(params_obj = params)
    params_obj.to_h.symbolize_keys
  end
end

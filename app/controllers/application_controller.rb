class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "You are not authorized to access this page."
  end
end

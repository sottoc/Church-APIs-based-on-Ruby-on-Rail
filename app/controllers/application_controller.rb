class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    if current_user.has_role? :media
      podcasts_path
    elsif current_user.has_role? :user
      root_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end

end

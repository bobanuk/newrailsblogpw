class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :store_location

  before_filter :configure_devise_parameters, if: :devise_controller?
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end


  protected

  def configure_devise_parameters
    devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password,
                                                            :password_confirmation, :remember_me, :avatar, :avatar_cache) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password,
                                                                   :password_confirmation, :current_password, :avatar, :avatar_cache) }
  end

end

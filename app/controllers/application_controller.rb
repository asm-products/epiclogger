class ApplicationController < ActionController::Base
  # include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  # before_action :authenticate_member!
  before_filter :set_gon

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :confirm_success_url
  end

  def set_gon
    info = {env:Rails.env}
    token = (params[:token].nil?) ? cookies[:lionseek_token] : params[:token]
    # info[:lionseek_token] = token if token
    info[:controller] = controller_name
    info[:action] = action_name
    gon.push(info)
  end
end

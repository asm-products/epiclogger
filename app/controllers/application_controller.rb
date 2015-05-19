class ApplicationController < ActionController::Base
  # include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  # before_action :authenticate_member!
  before_filter :set_gon

  def set_gon
    info = {env:Rails.env}
    token = (params[:token].nil?) ? cookies[:lionseek_token] : params[:token]
    # info[:lionseek_token] = token if token
    info[:controller] = controller_name
    info[:action] = action_name
    gon.push(info)
  end
end

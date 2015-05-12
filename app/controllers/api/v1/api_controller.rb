class Api::V1::ApiController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  layout nil
  before_action :authenticate_member!

  respond_to :json

  rescue_from ActiveRecord::RecordNotFound do |exception|
    # we save this exception as it is not an error if the restaurant or a parameter is not given
    render json: {:alert => exception.message}
  end

  def current_site
    # if params[:site_id] && user_signed_in?
    #   @current_site ||= current_user.sites.where("site.id = ?", params[:site_id]).try(:first)
    # end
    Website.find(params[:website_id])
  end
end
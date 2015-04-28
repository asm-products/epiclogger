class Api::HomeController < ApplicationController
  before_action :authenticate_api_member!

  def index
    render json: {message: "welcome #{current_api_member.email}"}
  end
end

class Api::V1::WebsitesController < Api::V1::ApiController

  def index
    @websites = current_member.websites
  end

  def create
  end
end

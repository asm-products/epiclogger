class Api::V1::UsersController < Api::V1::ApiController

  def index
    @subscribers = current_site.subscribers
  end

  def create
  end
end

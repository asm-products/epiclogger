class Api::V1::UsersController < Api::V1::ApiController

  def index
    @users = current_site.users
  end

  def create
  end
end

class Api::V1::MembersController < Api::V1::ApiController

  def show
    @member = current_user
  end
end

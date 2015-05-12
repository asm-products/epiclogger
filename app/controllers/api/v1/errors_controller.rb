class Api::V1::ErrorsController < Api::V1::ApiController
  def index
    @errors = current_site.issues
  end

  def create
  end
end

class MembersController < ApplicationController
  layout "landing", only: [:new, :create]
  skip_before_action :authenticate_member!

  def new
  end

  def create
  end
end

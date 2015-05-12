class SessionsController < ApplicationController
  layout "landing"
  skip_before_action :authenticate_member!

  def new
  end

  def create
  end
end

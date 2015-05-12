class HomeController < ApplicationController
  layout "landing"
  skip_before_action :authenticate_member!

  def index
  end
end

class Api::V1::UsersController < ApplicationController
  before_action :authenticate_member!

  def index

  end

  def create
  end
end

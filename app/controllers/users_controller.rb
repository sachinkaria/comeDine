class UsersController < ApplicationController

  before_action :authenticate_user!
  respond_to :json

  def show
    render json: current_user.tables
  end
end

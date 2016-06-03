class UsersController < ApplicationController

  before_filter :authenticate_user!
  respond_to :json

  def show
    @tables = current_user.tables
    @meals = Meal.where(table_id: @tables[0].id)

    render json: [@tables, @meals]
  end

end

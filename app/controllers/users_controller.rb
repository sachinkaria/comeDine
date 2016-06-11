class UsersController < ApplicationController

  before_filter :authenticate_user!
  respond_to :json

  def show
    @tables = current_user.tables
    @tables.length != 0 ? @meals = Meal.where(table_id: @tables[0].id) : @meals = 0
    # @booking = current.user.bookings
    render json: [@tables, @meals]
  end

end

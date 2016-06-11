class BookingsController < ApplicationController

  respond_to :json

  def index
    render json: Booking.all
  end

  def create
    meal = Meal.find(params[:meal_id])
    # meal.places -= booking_params[:spaces].to_i
    # meal.save
    render json: current_user.bookings.create(booking_params)
  end

  def update
    respond_with Meal.find(params[:id]).update(meal_params)
  end

  private

  def booking_params
    params.permit(:user_id,
                  :meal_id,
                  :status,
                  :spaces)
  end
end

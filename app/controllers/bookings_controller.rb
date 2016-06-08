class BookingsController < ApplicationController

  respond_to :json

  def index
    render json: Booking.all
  end

  def create
    render json: current_user.bookings.create(booking_params)
  end

  private

  def booking_params
    params.permit(:user_id,
                  :meal_id,
                  :status,
                  :spaces)
  end
end

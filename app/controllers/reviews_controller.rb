class ReviewsController < ApplicationController

respond_to :json

  def index
    @table = Table.find(params[:table_id])
    render json: @table.reviews.all
  end

  def create
    @table = Table.find(params[:table_id])
    render json: @table.reviews.create(review_params)
  end

  private

  def review_params
    params.permit(:comments, :rating_food, :rating_hygiene, :rating_atmosphere)
  end

end

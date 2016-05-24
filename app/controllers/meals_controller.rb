class MealsController < ApplicationController

  respond_to :json

  def index
    render json: Meal.all
  end

  def create
    table = Table.find(params[:table_id])
    render json: table.meals.create(meal_params)
  end

  def show
    render json: Meal.find(params[:id])
  end

  def update
    respond_with Meal.find(params[:id]).update(meal_params)
  end

  private

  def meal_params
    params.permit(:menu,
                  :date,
                  :time,
                  :places,
                  :cuisine_id)
  end
end

class TablesController < ApplicationController

respond_to :json

  def index
    @tables = Table.all
    render json: @tables
  end

  def create
    render json: current_user.tables.create(table_params)
  end

  def show
    render json: Table.find(params[:id])
  end

  def update
    render json: Table.find(params[:id]).update(table_params)
  end

  private

  def table_params
    params.permit(:name,
                  :spaces,
                  :house_number,
                  :street,
                  :city,
                  :postcode)
  end
end

class TablesController < ApplicationController

respond_to :json

  def index
    render json: Table.all
  end

  def create
    render json: Table.create(table_params)
  end

  def show
    render json: Table.find(params[:id])
  end

  def update
    render json: Table.find(params[:id]).update(delivery_params)
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

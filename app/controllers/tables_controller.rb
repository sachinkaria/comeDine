class TablesController < ApplicationController

  def index
    render json: Table.all
  end

  def create
    respond_with Table.create(table_params)
  end

  def show
    render json: Table.find(params[:id])
  end

  def update
    respond_with Table.find(params[:id]).update(delivery_params)
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

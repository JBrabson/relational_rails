class AutoDealershipsAutomobilesController < ApplicationController
  def index
    @auto_dealership = AutoDealership.find(params[:id])
    @automobiles = @auto_dealership.automobiles.all
    @automobiles = @automobiles.order_by_make
  end

  def show
    @automobile = Automobile.find(params[:id])
  end

  def new
    @auto_dealership = AutoDealership.find(params[:id])
  end

  def create
    @auto_dealership = AutoDealership.find(params[:id])
    @auto_dealership.automobiles.create!(automobile_params)

    redirect_to "/auto_dealerships/#{@auto_dealership.id}/automobiles"
  end

  private

  def automobile_params
    params.permit(:preowned, :year, :make, :model, :color, :automatic, :engine, :horsepower,
      :cylinders, :drive_train, :price, :seating_capacity)
  end

  private
    def auto_dealership_params
      params.require(:auto_dealership).permit(:name, :preowned_sales, :foreign_inventory, :city, :state)
    end
end

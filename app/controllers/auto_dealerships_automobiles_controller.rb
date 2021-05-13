class AutoDealershipsAutomobilesController < ApplicationController
  def index
    @auto_dealership = AutoDealership.find(params[:id])
    @automobiles = @auto_dealership.automobiles.all
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

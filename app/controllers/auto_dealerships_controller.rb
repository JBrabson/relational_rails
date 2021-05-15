class AutoDealershipsController < ApplicationController

  def index
    @auto_dealerships = AutoDealership.all
  end

  def show
    @auto_dealership = AutoDealership.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
    @auto_dealership = AutoDealership.new(auto_dealership_params)
    @auto_dealership.save!

    redirect_to '/auto_dealerships'
  end

  def update
  end

  def destroy
  end

  private
    def auto_dealership_params
      params.permit(:name, :preowned_sales, :foreign_inventory, :city, :state)
    end
end

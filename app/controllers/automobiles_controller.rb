class AutomobilesController < ApplicationController

  def index
    @automobiles = Automobile.all
  end

  def show
    @automobile = Automobile.find(params[:id])
  end

  def new
  end

  def create
    @auto_dealership = AutoDealership.find(params[:id])
    @automobile = AutoDealership.automobiles.new(automobile_params)

    @automobile.save

    redirect_to "/auto_dealerships/#{@auto_dealership.id/automobiles}"
  end

  def edit
    @automobile = Automobile.find(params[:id])
  end

  def update
    automobile = Automobile.find(params[:id])
    automobile.update(automobile_params)
    automobile.save!
    redirect_to "/automobiles/#{automobile.id}"
  end

  def destroy
  end

  private
    def automobile_params
      params.permit(:preowned, :year, :make, :model, :color, :automatic, :engine, :horsepower, :cylinders, :drive_train, :price, :seating_capacity)
    end
end

class AutomobilesController < ApplicationController

  def index
    @automobiles = Automobile.all
  end

  def show
  end

  def new
    @automobile = Automobile.new
  end

  def edit
  end

  def create
    @auto_dealership = AutoDealership.find(params[:id])
    automobile = Automobile.new(automobile_params)

    automobile.save

    redirect_to "/auto_dealerships/#{@auto_dealership.id/automobiles}"
  end

  # PATCH/PUT /automobiles/1 or /automobiles/1.json
  def update

  end

  # DELETE /automobiles/1 or /automobiles/1.json
  def destroy
  end

  private
    def automobile_params
      params.require(:automobile).permit(:preowned, :year, :make, :model, :color, :automatic, :engine, :horsepower, :cylinders, :drive_train, :price, :seating_capacity)
    end
end

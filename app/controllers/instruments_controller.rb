class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.rentable
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def update
    instrument = Instrument.find(params[:id])
    instrument.update(instrument_params)
    redirect_to "/instruments/#{instrument.id}"
  end

  def destroy
    instrument = Instrument.find(params[:id])
    instrument.destroy
    redirect_to '/instruments'
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def find_exact
    @instruments = Instrument.all.find_exact(params)
  end

  def find_partial
    @instruments = Instrument.all.find_partial(params)
  end

private
  def instrument_params
    params.permit(:kind, :rent_to_own, :cost)
  end
end
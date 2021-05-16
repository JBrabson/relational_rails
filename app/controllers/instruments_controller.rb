class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.where("rent_to_own = true")
  end

  # def new
  # end

  # def create
  #   instrument = music_store.instruments.create!(instrument_params)
  #   redirect_to '/instruments'
  # end

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

private
  def instrument_params
    params.permit(:kind, :rent_to_own, :cost)
  end
end
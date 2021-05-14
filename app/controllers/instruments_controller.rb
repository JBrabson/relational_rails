class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def show
    # require 'pry'; binding.pry
    @instrument = Instrument.find(params[:id])
  end
end
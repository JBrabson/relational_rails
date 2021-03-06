class MusicStoreInstrumentsController < ApplicationController
  def index
    @music_store = MusicStore.find(params[:id])
    @instruments = @music_store.instruments
  end

  def new
    @music_store = MusicStore.find(params[:id])
  end

  def create
    music_store = MusicStore.find(params[:id])
    instrument = music_store.instruments.create!(instrument_params)
    redirect_to "/music_stores/#{music_store.id}/instruments"
  end

  def sort
    @music_store = MusicStore.find(params[:id])
    @instruments = @music_store.instruments.order(:kind)
  end

  def filter
    @music_store = MusicStore.find(params[:id])
    @instruments = @music_store.instruments.find_all do |instrument|
      instrument.cost > params["price"].to_i
    end
  end

private
  def instrument_params
    params.permit(:kind, :rent_to_own, :cost)
  end
end
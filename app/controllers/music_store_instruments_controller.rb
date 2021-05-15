class MusicStoreInstrumentsController < ApplicationController
  def index
    @music_store = MusicStore.find(params[:id])
    @instruments = @music_store.instruments
  end
end
class MusicStoresController < ApplicationController
  def index
    @music_stores = MusicStore.all
  end

  def show
    @music_store = MusicStore.find(params[:id])
  end
end
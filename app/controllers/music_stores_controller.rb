class MusicStoresController < ApplicationController
  def index
    @music_stores = MusicStore.sort_by_date
  end

  def new
  end

  def create
    music_store = MusicStore.create!(music_store_params)
    redirect_to '/music_stores'
  end

  def edit
    @music_store = MusicStore.find(params[:id])
  end

  def update
    music_store = MusicStore.find(params[:id])
    music_store.update(music_store_params)
    redirect_to '/music_stores'
  end

  def destroy
    music_store = MusicStore.find(params[:id])
    music_store.instruments.each do |instrument|
      instrument.destroy
    end
    music_store.destroy
    redirect_to '/music_stores'
  end

  def show
    @music_store = MusicStore.find(params[:id])
    @instrument_count = @music_store.instruments.count
  end

  def find_exact
    @music_stores = MusicStore.find_exact(params)
  end

  def find_partial
    @music_stores = MusicStore.find_partial(params)
  end

  def sort
    @music_stores = MusicStore.all.sort
  end

private
  def music_store_params
    params.permit(:name, :rents, :lesson_cost)
  end
end
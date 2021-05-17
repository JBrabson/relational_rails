class MusicStoresController < ApplicationController
  def index
    @music_stores = MusicStore.order(created_at: :desc)
  end

  def new
  end

  def find_exact
    @music_stores = MusicStore.all.find_all do |music_store|
      music_store.name.downcase == params["search"].downcase
    end
  end

  def find_partial
    @music_stores = MusicStore.all.find_all do |music_store|
      music_store.name.downcase.include?(params["search"].downcase) == true
    end
  end

  def sort
    @music_stores = MusicStore.all.sort do |a, b|
      b.instruments.count <=> a.instruments.count
    end
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

private
  def music_store_params
    params.permit(:name, :rents, :lesson_cost)
  end
end